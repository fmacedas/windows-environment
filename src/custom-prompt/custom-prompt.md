# Custom Prompt

- [Custom Prompt](https://stackoverflow.com/questions/36047706/show-current-git-branch-name-in-windows-command-prompt)

```
@echo off
git.exe %*
set GITBRANCH=
for /f %%I in ('git.exe rev-parse --abbrev-ref HEAD 2^> NUL') do set GITBRANCH=%%I

if "%GITBRANCH%" == "" (
  prompt $E[32m$E]9;8;"USERNAME"$E\@$E]9;8;"COMPUTERNAME"$E\$S$E[92m$P$E[0m$_$E[33m$T$E[0m$S$$$S
) else (
  prompt $E[32m$E]9;8;"USERNAME"$E\@$E]9;8;"COMPUTERNAME"$E\$S$E[92m$P$E[0m$_$E[33m$T$E[0m$S{$E[32m%GITBRANCH%$E[0m}$S$$$S
)
```