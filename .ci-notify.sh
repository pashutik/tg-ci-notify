#!/bin/bash

t="10"

url="https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage"

text_start="\
👻Start of Pipeline👻%0A\
Project:+$CI_PROJECT_NAME%0A\
URL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0A\
Branch:+$CI_COMMIT_REF_SLUG%0A\
Commit:+$CI_COMMIT_MESSAGE%0A\
Commiter:+$GITLAB_USER_NAME"

text_success="\
Deploy status: Successfull✅%0A%0A\
Project:+$CI_PROJECT_NAME%0A\
URL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0A\
Branch:+$CI_COMMIT_REF_SLUG%0A\
Commit:+$CI_COMMIT_MESSAGE%0A\
Commiter:+$GITLAB_USER_NAME"

text_faile="\
Deploy status: Failed❌%0A%0A\
Project:+$CI_PROJECT_NAME%0A\
URL:+$CI_PROJECT_URL/pipelines/$CI_PIPELINE_ID/%0A\
Branch:+$CI_COMMIT_REF_SLUG%0A\
Commit:+$CI_COMMIT_MESSAGE%0A\
Commiter:+$GITLAB_USER_NAME"

for i in $TELEGRAM_CHANEL_ID;
	do
		case $1 in
			start)
				curl -s --max-time $t -d "chat_id=$i&disable_web_page_preview=1&text=$text_start" $url > /dev/null;;
			faile)
				curl -s --max-time $t -d "chat_id=$i&disable_web_page_preview=1&text=$text_faile" $url > /dev/null;;
			success)
				curl -s --max-time $t -d "chat_id=$i&disable_web_page_preview=1&text=$text_success" $url > /dev/null;;
		esac
	done
exit 0