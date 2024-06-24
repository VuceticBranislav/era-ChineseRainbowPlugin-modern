<!-- Back to top anchor -->
<a name="readme-page-top"></a>

<!-- Project Shields -->
<span align="center">

  [![Contributors][contributors-shield]][contributors-url]
  [![Forks][forks-shield]][forks-url]
  [![Stargazers][stars-shield]][stars-url]
  [![Issues][issues-shield]][issues-url]
  [![MIT License][license-shield]][license-url]

</span>

<!-- Project Logo -->
<div align="center">
  
  ### ERA 3 - Chinese Rainbow Plugin (WoG 中文化插件)
  <p align="center">
    <i>Code ported from Delphi 7 version to modern Delphi (Delphi XE, 10, 11 & 12)<br/>
    Original author of Chinese plug-in is Youyi (gu7979gu) 有利制作 QQ:123133263, 2009.01.27.<br/>
    This repository contains Chinese Rainbow Plugin, originally part of ERA repository.<br/><br/>
    Code is from ethernidee's <a href="https://github.com/ethernidee/era/tree/master/Chinese_Rainbow_Plugin">ERA</a> repositories commit: <a href="https://github.com/ethernidee/era/tree/83748fff4c34b964f6c28f74f634ae1a65804b18"><strong>83748ff</strong></a>   
    <br/></i>   
  </p>
</div>

<span align="center">

  [![Original][OriginalGH-bdg]][OriginalGH-url]
  [![Delphi][Delphi-bdg]][Delphi-url]
  [![Discord][Discord-bdg]][Discord-url]
  [![LinkedIn][linkedin-shield]][linkedin-url]

</span>

## About The Project
<p align="justify">
  Project code has been ported from Delphi 7 version to the newest Delphi version. Minimal changes to 
  code are introduced. Main purpose of this project is to continue its legacy and provide updated functionalities. 
  Original goals and functionalities have been preserved. The porting process has been carefully executed to 
  ensure that the project retains its original essence while leveraging the latest features of the new Delphi version. 
  Original code has beed developed by Youyi (gu7979gu). Code is included in ERA by <a href="https://github.com/ethernidee">ethernidee</a>.
</p>

Project goals:
* Compile code using modern version of Delphi.
* Make minimal changes to the code.
* Ensure that code line numbers align with the original code lines for easier comparison.
* Avoid adding any additional features or improvements.
  
## Fonts
Fonts should be copied to location where game can find it.<br>
Chinese fonts list:
* HZK10
* hzk10_GBK
* hzk12
* hzk12_GBK
* HZK24
* hzk24_GBK

## LocaleEmulator

<a href="https://github.com/xupefei/Locale-Emulator">LocaleEmulator</a> is included in this repository to easily run the game in a different code page without changing the system code page.

Steps to use:
1) Copy content of "LocaleEmulator" folder to game folder. You will find 2 predefined setups in LocaleEmulator folder: Chinese and Russian,
2) Run game trough command line (or create shortcut) using this template:<br/>
   ```"LEProc.exe location" -runas "Settings GUID" "Heroes exe location"<br/>```<br/>
   Where:<br/>
      ```"LEProc.exe location"``` - Full path to LEProc.exe in copied LocaleEmulator  folder<br/>
      ```"Settings GUID"``` - ```10000000-0000-0000-0000-000000000000``` Chinese, ```20000000-0000-0000-0000-000000000000``` Russian<br/>
      ```"Heroes exe"``` - Full path to game exe<br/>
Example: ```"d:\Games\Heroes3\LocaleEmulator\LEProc.exe" -runas "10000000-0000-0000-0000-000000000000" "d:\Games\Heroes3\h3era hd.exe"```<br/><br/>
This allows running game in the Chinese code page without changing system code page.<br/>
The only drawback is that the command line or a shortcut must be used.

<div align="right">

[![GoUp][GoToTop-bdg]][GoToTop-url]

</div>

<!-- =============================================================================================================== -->

<!-- Acknowledgments 
Open Source License          https://choosealicense.com
GitHub Emoji Cheat Sheet     https://www.webpagefx.com/tools/emoji-cheat-sheet
Malven's Flexbox Cheatsheet  https://flexbox.malven.co/
Malven's Grid Cheatsheet     https://grid.malven.co/
Img Shields                  https://shields.io
GitHub Pages                 https://pages.github.com
Font Awesome                 https://fontawesome.com
React Icons                  https://react-icons.github.io/react-icons/search
Markdownguide                https://www.markdownguide.org/basic-syntax/#reference-style-links -->

<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/VuceticBranislav/era-ChineseRainbowPlugin-modern.svg?style=flat
[contributors-url]:    ../../graphs/contributors
[forks-shield]:        https://img.shields.io/github/forks/VuceticBranislav/era-ChineseRainbowPlugin-modern.svg?style=flat
[forks-url]:           ../../network/members
[stars-shield]:        https://img.shields.io/github/stars/VuceticBranislav/era-ChineseRainbowPlugin-modern.svg?style=flat
[stars-url]:           ../../stargazers
[issues-shield]:       https://img.shields.io/github/issues/VuceticBranislav/era-ChineseRainbowPlugin-modern.svg?style=flat
[issues-url]:          ../../issues
[license-shield]:      https://img.shields.io/github/license/VuceticBranislav/era-ChineseRainbowPlugin-modern.svg?style=flat
[license-url]:         ../../blob/master/LICENSE.txt
[linkedin-shield]:     https://img.shields.io/badge/-LinkedIn-black.svg?style=flat&logo=linkedin&colorB=555
[linkedin-url]:        https://www.linkedin.com/in/vuceticbranislav/
[OriginalGH-bdg]:      https://img.shields.io/badge/Original_Code-181717?style=flat&logo=github&logoColor=white&colorB=555
[OriginalGH-url]:      https://github.com/ethernidee
[Delphi-bdg]:          https://img.shields.io/badge/Delphi_RAD_Studio-B22222?style=flat&logo=delphi&logoColor=white
[Delphi-url]:          https://www.embarcadero.com/
[Discord-bdg]:         https://img.shields.io/badge/Discord-7289DA?style=flat&logo=discord&logoColor=white
[Discord-url]:         https://discord.com/channels/665742159307341827/1105827060812873748
[GoToTop-bdg]:         https://img.shields.io/badge/Go%20to%20top-blue
[GoToTop-url]:         #readme-page-top