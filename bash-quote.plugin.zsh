
function bash-quote {
    emulate -L zsh
    Q=$(curl -s https://bash.im/random | iconv -c -f CP1251 -t UTF-8 | grep "<div class=\"text\">" | head -n 1)

    TXT=$(echo "$Q" | grep "<div class=\"text\">" | head -n 1 | sed -e 's/<br>/\\n\\t/g' -e "s/<[^>]*>//g" -e "s/\&lt\;/</g" -e "s/\&gt\;/>/g" -e "s/\&quot\;/\"/g")

    [[ -n "$TXT" ]] && print -P "%F{5}${TXT}%f"
}
