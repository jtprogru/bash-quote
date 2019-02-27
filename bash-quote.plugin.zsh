
function bash-quote {
    emulate -L zsh
    Q=$(http --default-scheme=https https://bash.im/random | iconv -c -f CP1251 -t UTF-8 | grep "<div class=\"text\">" | head -n 1)

    TXT=$( echo $Q| grep "<div class=\"text\">" | head -n 1 | sed 's/<br>/\\n\\t/g' | sed -e "s/<[^>]*>//g" | sed -e "s/\&lt\;/</g" | sed -e "s/\&gt\;/>/g" | sed "s/\&quot\;/\"/g")

     [[ -n "$TXT" ]] && print -P "%F{5}${TXT}%f"
}
