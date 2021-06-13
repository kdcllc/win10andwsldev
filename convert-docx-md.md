# Converting Microsoft Word Documents to Markdown files

## Install

```ps2
    winget install JohnMacFarlane.Pandoc

    # check install
    pandoc -v
```

## Convert

```powershell
    pandoc -f docx -t markdown faq.docx -o faq_markdown.md
```