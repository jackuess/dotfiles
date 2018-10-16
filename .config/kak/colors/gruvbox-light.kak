# gruvbox-light theme

evaluate-commands %sh{
    gray="rgb:928374"
    red="rgb:9d0006"
    green="rgb:79740e"
    yellow="rgb:b57614"
    blue="rgb:076678"
    purple="rgb:8f3f71"
    aqua="rgb:427b58"
    orange="rgb:d65d0e"

    bg="rgb:fbf1c7"
    bg1="rgb:ebdbb2"
    bg2="rgb:d5c4a1"
    bg3="rgb:bdae93"
    bg4="rgb:a89984"

    fg0="rgb:282828"
    fg="rgb:3c3836"
    fg2="rgb:504945"
    fg3="rgb:665c54"
    fg4="rgb:7c6f64"

    echo "
        # Code highlighting
        face global value     ${orange}
        face global type      ${yellow}
        face global variable  ${blue}
        face global module    ${green}
        face global function  ${aqua}
        face global string    ${green}
        face global keyword   ${red}
        face global operator  default
        face global attribute ${orange}
        face global comment   ${gray}
        face global meta      ${aqua}
        face global builtin   ${purple}

        # Markdown highlighting
        face global title     ${green}+b
        face global header    ${orange}
        face global bold      ${fg}+b
        face global italic    ${fg3}
        face global mono      ${fg4}
        face global block     default
        face global link      default
        face global bullet    default
        face global list      default

        face global Default            ${fg},${bg}
        face global PrimarySelection   ${bg1},${fg0}
        face global SecondarySelection ${bg},${blue}
        face global PrimaryCursor      ${bg},${fg}
        face global SecondaryCursor    ${bg},${fg}
        face global PrimaryCursorEol   ${bg},${fg4}
        face global SecondaryCursorEol ${bg},${fg4}
        face global LineNumbers        ${bg4}
        face global LineNumberCursor   ${yellow},${bg}
        face global MenuForeground     ${bg2},${blue}
        face global MenuBackground     ${fg2},${bg2}
        face global MenuInfo           ${fg4}
        face global Information        ${bg},${fg4}
        face global Error              ${bg},${red}
        face global StatusLine         ${fg},${bg1}
        face global StatusLineMode     ${yellow}+b
        face global StatusLineInfo     ${purple}
        face global StatusLineValue    ${orange}
        face global StatusCursor       ${bg},${fg}
        face global Prompt             ${yellow},${bg}
        face global MatchingChar       ${fg},${bg1}+b
        face global BufferPadding      ${bg2},${bg}
        face global Whitespace         ${bg2}

        # Kak-LSP
        face global DiagnosticError    ${orange},${bg2}
        face global DiagnosticWarning  ${orange},${bg1}
    "
}
