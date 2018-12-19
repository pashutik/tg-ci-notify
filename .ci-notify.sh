#!/bin/bash
 
TIME="10"
URL="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"
TEXT_SUCCESS="\
Deploy status: Successfull✅%0A%0A\
Project:+$CI_PROJECT_NAME%0A\
URL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0A\
Branch:+$CI_COMMIT_REF_SLUG%0A\
Commit:+$CI_COMMIT_MESSAGE%0A\
Commiter:+$GITLAB_USER_NAME"
 
TEXT_FAILE="\
Deploy status: Failed❌%0A%0A\
Project:+$CI_PROJECT_NAME%0A\
URL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0A\
Branch:+$CI_COMMIT_REF_SLUG%0A\
Commit:+$CI_COMMIT_MESSAGE%0A\
Commiter:+$GITLAB_USER_NAME"

if [[ $1 == "faile" ]];
    then
        for TELEGRAM_USER_ID in $USERS_FOR_NOTIFY;
            do
                curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT_FAILE" $URL > /dev/null
            done
    elif [[ $1 == "success" ]];
        then
        for TELEGRAM_USER_ID in $USERS_FOR_NOTIFY;
            do
                curl -s --max-time $TIME -d "chat_id=$TELEGRAM_USER_ID&disable_web_page_preview=1&text=$TEXT_SUCCESS" $URL > /dev/null
            done
fi
exit