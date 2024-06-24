﻿unit Main;

interface

uses
  Windows, Classes, H32GameFunction, Legacy;

  procedure BeginWork1; stdcall;

const
  //中文化使用全局变量
  // Global vars for Chinese localisation
  CutTemp1: integer = $004B5A3A;
  CutTemp2: integer = $004B5A5B;
  WordWarp1: integer = $004B57B4;
  WordWarp2: integer = $004B57CD;

var
  F12, F24, F10: TMemoryStream;
  DialogResult: integer;

implementation

//把汉化需要用到的2种点阵字库装入内存,这2种字体分别是12*12的hzk12和24*24的hzk24
// Writting the Chinese character library into ram. The two sizes of fonts are 12*12 and 24*24
procedure InitFont;
var
  path: array[0..255] of myWChar;

begin
  F10 := TMemoryStream.Create;
  F12 := TMemoryStream.Create;
  F24 := TMemoryStream.Create;

  GetModuleFileName(HInstance, path, Length(path));

  if not Legacy.FileExists(Legacy.ExtractFilePath(Legacy.StrPas(path)) + 'hzk12') then begin
    MessageBox(0, '没有找到字体文件hzk12', 'Error', MB_OK); // Show error msg "Failed to find character lib hzk12"
    Exit;
  end;

  if not Legacy.FileExists(Legacy.ExtractFilePath(Legacy.StrPas(path)) + 'HZK24') then begin
    MessageBox(0, '没有找到字体文件HZK24H', 'Error', MB_OK); // Show error msg "Failed to find character lib hzk24H"
    Exit;
  end;

  F12.LoadFromFile(Legacy.ExtractFilePath(Legacy.StrPas(path)) + 'hzk12');
  F24.LoadFromFile(Legacy.ExtractFilePath(Legacy.StrPas(path)) + 'HZK24');
  F10.LoadFromFile(Legacy.ExtractFilePath(Legacy.StrPas(path)) + 'HZK10');
end;

function GetH3Version: integer;
var
  Buf: array[0..7] of byte;
  BytesRead: dword;

begin
  result := 0;
  ReadProcessMemory(GetCurrentProcess, pointer($004F8701), @Buf, 8, BytesRead);

  if (Buf[0] = $2D) and (Buf[1] = $49) and (Buf[2] = $9C) and (Buf[3] = $00) and (Buf[4] = $00) and
    (Buf[5] = $74) and (Buf[6] = $7C) and (Buf[7] = $83) then
    result := 32;
end;
//使用中发现直接写地址不稳定，在WOG版本可以成功，但在32版中会出错，原因不明
// Known issue: Writing in addresses here works for WoG, although for some reason,
// it doesn't work for SoD 3.2
procedure BeginWork; stdcall;
begin
  case GetH3Version of
    32:
    begin
      InitFont;
      //HOOK $004b5a32,截断字符串函数
      // Function for cutting string
      pByte($004b5a32)^      := $e9;
      pInteger($00004b5a33)^ := integer(@MyCutWidth) - $004b5a37;
      pByte($004b5a37)^      := $90;
      pByte($004b5a38)^      := $90;
      pByte($004b5a39)^      := $90;
      //拦截英文输出-新
      // Disabling English output
      pByte($004b5202)^ := $e9;
      pInteger($00004b5203)^ := integer(@MyTextOut_New) - $004b5207;
      pByte($004b5207)^ := $90;
      //此修正和下一个修正一起使用
      // This fix must be used with the following
      pByte($004f6569)^ := $b8;
      pByte($004f656a)^ := $80;
      pByte($004f656b)^ := $01;
      pByte($004f656c)^ := $00;
      pByte($004f656d)^ := $00;
      pByte($004f656e)^ := $90;
      pByte($004f656f)^ := $90;
      pByte($004f6570)^ := $90;
      //和上一个修正一起，解决中文化后冒险界面下一些右键显示对话框长度太长问题，
      //比如右键点击地层切换按钮
      // This fix must be used with the patch above. It's for fixing the width of dialogues (sometimes getting too wide)
      pByte($004f6599)^ := $b8;
      pByte($004f659a)^ := $80;
      pByte($004f659b)^ := $01;
      pByte($004f659c)^ := $00;
      pByte($004f659d)^ := $00;
      pByte($004f659e)^ := $90;
      pByte($004f659f)^ := $90;
      pByte($004f65a0)^ := $90;
      //WordWrap
      pByte($004b57ab)^ := $e9;
      pInteger($004b57ac)^ := integer(@MyWordWarp) - $004b57b0;
      pByte($004b57b0)^ := $90;
      pByte($004b57b1)^ := $90;
      pByte($004b57b2)^ := $90;
      pByte($004b57b3)^ := $90;
      //返回一段文字的总行数
      // Return the number of rows of a paragraph
      pByte($004b5580)^ := $e9;
      pInteger($004b5581)^ := integer(@MyDialog) - $004b5585;
      pByte($004b5585)^ := $90;
    end;
  end;
end;

procedure BeginWork1; stdcall;
const
  Data: byte = $E9;
  Data1: byte = $90;
  Data4: array[0..4] of byte = ($B8, $80, $01, 0, 0);
var
  BytesRead: dword;
  pMyCutWidth, pMyTextOut, pMyWordWarp, pMyDialog: integer;
begin
  case GetH3Version of
    32:
    begin
      InitFont;
      //HOOK $004b5a32,截断字符串函数
      // Function for cutting string
      pMyCutWidth := integer(@MyCutWidth);
      pMyCutWidth := pMyCutWidth - $004b5a37;
      WriteProcessMemory(GetCurrentProcess, pointer($004b5a32), @Data, 1, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004b5a33), @pMyCutWidth, 4, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004b5a37), @data1, 1, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004b5a38), @data1, 1, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004b5a39), @data1, 1, BytesRead);
      //拦截英文输出-新
      // Disabling English output
      pMyTextOut := integer(@MyTextOut_New);
      pMyTextOut := pMyTextOut - $004b5207;
      WriteProcessMemory(GetCurrentProcess, pointer($004b5202), @Data, 1, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004b5203), @pMyTextOut, 4, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004b5207), @data1, 1, BytesRead);
      //和下一个修正一起使用
      // This fix must be used with the following
      // Patch GetMaxWordWidth
      WriteProcessMemory(GetCurrentProcess, pointer($004f6569), @data4, 5, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004f656e), @data1, 1, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004f656f), @data1, 1, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004f6570), @data1, 1, BytesRead);
      //此修正是解决中文化后冒险界面下一些右键显示对话框长度太长问题，比如右键点击地层切换按钮
      // This fix must be used with the patch above. It's for fixing the width of dialogues (sometimes getting too wide)
      // Patch GetMaxLineWidth to be 352px
      WriteProcessMemory(GetCurrentProcess, pointer($004f6599), @data4, 5, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004f659e), @data1, 1, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004f659f), @data1, 1, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004f65a0), @data1, 1, BytesRead);
      //DIALOG(WordWrap)
      pMyWordWarp := integer(@MyWordWarp);
      pMyWordWarp := pMyWordWarp - $004b57b0;
      WriteProcessMemory(GetCurrentProcess, pointer($004b57ab), @Data, 1, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004b57ac), @pMyWordWarp, 4, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004b57b0), @data1, 1, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004b57b1), @data1, 1, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004b57b2), @data1, 1, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004b57b3), @data1, 1, BytesRead);
      //DIALOG(返回对话框的行数)
      // Return the number of rows of the dialogue
      pMyDialog := integer(@MyDialog);
      pMyDialog := pMyDialog - $004b5585;
      WriteProcessMemory(GetCurrentProcess, pointer($004b5580), @Data, 1, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004b5581), @pMyDialog, 4, BytesRead);
      WriteProcessMemory(GetCurrentProcess, pointer($004b5585), @data1, 1, BytesRead);
    end;
  end;
end;

end.
