rem robocopy .\Domain M:/PiStar/Domain /s /e /R:0 /W:0  /XJ /XD ".\.git", ".\.vs", ".\.venv" /XF *.pyc
rem robocopy .\libs M:/PiStar/libs /e /R:0 /W:0  /XJ /XD ".\.git", ".\.vs", ".\.venv" /XF *.pyc
rem robocopy .\Screens M:/PiStar/Screens /e /R:0 /W:0  /XJ /XD ".\.git", ".\.vs", ".\.venv" /XF *.pyc
rem robocopy . M:/PiStar /e /R:0 /W:0  /XJ /XD ".\.git", ".\.vs", ".\.venv" /XF *.pyc

robocopy .\Domain N:/PiStar/Domain /e /R:0 /W:0  /XJ /XD ".\.git", ".\.vs", ".\.venv" /XF *.pyc
robocopy .\libs N:/PiStar/libs /e /R:0 /W:0  /XJ /XD ".\.git", ".\.vs", ".\.venv" /XF *.pyc
robocopy .\Screens N:/PiStar/Screens /e /R:0 /W:0  /XJ /XD ".\.git", ".\.vs", ".\.venv" /XF *.pyc
robocopy .\main.py N:/PiStar/ 

rem /NFL /NDL