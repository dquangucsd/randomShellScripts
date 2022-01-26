function sumoutloud {
    num_nums=$#
    echo $num_nums
    arr_nums=$@
    echo $arr_nums
}

sumoutloud 1 2 3

function single_bracket_test {
    n_args=1
    echo "n_args=$n_args"
    if [ "$n_args" -lt 1 ]; then
        echo "incorrect number of args"
    fi
}

#single_bracket_test

function user_prompt {
    tracknum=""
    until [ ${#tracknum} -eq 16 ]; do
        echo -n "Enter tracking number: " #Displays prompt
        read tracknum #gets user input
    done

    echo "Tracking package number $tracknum"
    track_package "$tracknum"
}

#user_prompt

function selected_words {
    #script that prints selected words from a provided message
    #(important_msg) <- list of words
    #(ind_select) <- list of indexes

    important_msg=("Cats" "love" "Sashquatches" "eating" "sun" "flowers")
    ind_select=(5 3 2)

    for ind in ${ind_select[@]}; do #iterate thru ind_select indexes
        echo -n "${important_msg[ind]} " #prints selected word with index and a trailing space
    done
    echo #newline
}

#selected_words

function verbose_true_false {
    ARG1="$1"
    case "$ARG1" in
        "true")
            echo "I knew it"
            exit 0;;
        "false")
            echo "Of course"
            exit 1;;
        *)
            echo "Error"
            exit 1;;
    esac
}
#verbose_true_false true


function check_user_log_in {
    if [ $# -ne 1  ]; then
        echo "Usage: check_user_log_in username"
        exit 1
    else
        username="$1"
    fi

    until who | grep "$username" > /dev/null; do
        sleep 10
    done
    echo "ALERT: User has logged in"
    exit 0
}
#check_user_log_in dquang

