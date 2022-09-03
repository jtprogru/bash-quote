
function bash-quote {
    emulate -L zsh
    Q=$(curl -s http://bashorg.org/random | iconv -c -f CP1251 -t UTF-8 | grep "<div class=\"text\">" | head -n 1)

    TXT=$(echo "$Q" | grep "<div class=\"text\">" | head -n 1 | sed -e 's/<br>/\\n\\t/g' -e "s/<[^>]*>//g" -e "s/\&lt\;/</g" -e "s/\&gt\;/>/g" -e "s/\&quot\;/\"/g")

    if [[ ! -n "$TXT" ]]; then
        echo "Error: unable to parse http://bashorg.org/random/random response."
        exit 1
    fi
    
    if [[ "$1" == "--color" ]]; then
        print -P "%F{5}${TXT}%f"
    else
        echo "$TXT"
    fi
}
