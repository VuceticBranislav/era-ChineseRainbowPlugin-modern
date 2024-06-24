unit Legacy;
{
DESCRIPTION:
AUTHOR:
}

interface

uses SysUtils, AnsiStrings;

type
  myChar  = System.AnsiChar;
  myWChar = System.WideChar;
  myPChar = System.PAnsiChar;
  myPWChar= System.PWideChar;
  myPPChar= System.PPAnsiChar;
  myAStr  = System.AnsiString;
  myPAStr = System.PAnsiString;
  myWStr  = System.UnicodeString;
  myPWStr = System.PUnicodeString;

function FileExists(const FileName: myWStr; FollowLink: Boolean = True): Boolean;
function ExtractFilePath(const FileName: myWStr): myWStr;
function StrPas(const Str: myPWChar): myWStr;
function Format(const Format: myWStr; const Args: array of const): myWStr;

implementation

function FileExists(const FileName: myWStr; FollowLink: Boolean = True): Boolean;
begin
   Result := SysUtils.FileExists(FileName, FollowLink);
end;

function ExtractFilePath(const FileName: myWStr): myWStr;
var
  I: Integer;
begin
  I := LastDelimiter(PathDelim + DriveDelim, FileName);
  Result := Copy(FileName, 1, I);
end;

function StrPas(const Str: myPWChar): myWStr;
begin
  Result := Str;
end;

function Format(const Format: myWStr; const Args: array of const): myWStr;
begin
  // Note: Using the global FormatSettings formatting variables is not thread-safe.
  SysUtils.FmtStr(Result, Format, Args);
end;

end.
