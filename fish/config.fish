#echo 'export PATH="/usr/bin:$PATH"' >> ~/.bashrcD
export PATH="$HOME/.cargo/bin:$PATH"
if status is-interactive

    set LAST_REP ""

    function cd
        builtin cd $argv
        git rev-parse HEAD 1>/dev/null 2>/dev/null

        if test $status -eq 0
            if not test "$LAST_REP" = (git rev-parse HEAD)
                onefetch
                set LAST_REP (git rev-parse HEAD)
            end
        else
            set LAST_REP ""
        end
    end
    set fish_greeting
    #set --erase fish_greeting

    alias logout='sudo skill -KILL -u arthur'
alias vault-open='sudo cryptsetup luksOpen /dev/vault luks-e41fe6db-d209-42b6-891a-1f097a1a1308 && sudo mount /dev/mapper/luks-e41fe6db-d209-42b6-891a-1f097a1a1308 /media/arthur/Vault -t vfat -o defaults,umask=000'
alias vault-close='sudo umount /dev/mapper/luks-e41fe6db-d209-42b6-891a-1f097a1a1308 && sudo cryptsetup luksClose luks-e41fe6db-d209-42b6-891a-1f097a1a1308'

    alias cat='batcat --paging=never'
    alias v="nvim $1"
    alias r="ranger $1"
    alias l='ls -w 3 --color=always --group-directories-first'
    alias ll='ls -w 3 --color=always --group-directories-first -a -l -h'
    alias ncspot='flatpak run io.github.hrkfdn.ncspot'


    neofetch --source ~/.config/neofetch/ascii
end

zoxide init fish | source
