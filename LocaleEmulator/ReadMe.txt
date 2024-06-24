Running game using Chinese code page.

Use LocaleEmulator instead of changing system code page.

To use it:
1) Copy content of "LocaleEmulator" folder to game folder. You will find 2 predefined setups: Chinese and Russian in LocaleEmulator folder,
2) Run game trough command line (or create shortcut) using this template:
   "<LEProc.exe location>" -runas "<Settings GUID>" "<Heroes exe>"
      "<LEProc.exe location>" - Full path to LEProc.exe in copied LocaleEmulator  folder
      "<Settings GUID>" - 10000000-0000-0000-0000-000000000000 Chinese, 20000000-0000-0000-0000-000000000000 Russian
      "<Heroes exe>" - Full path to game exe
	  
Example: "d:\Games\Heroes3\LocaleEmulator\LEProc.exe" -runas "10000000-0000-0000-0000-000000000000" "d:\Games\Heroes3\h3era hd.exe"

This allows running Delphi in the system code page and the game in the Chinese code page.
It is easy to switch from Chinese to Russian.
The only drawback is that the command line or a shortcut must be used.