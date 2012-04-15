# Custom Bash prompt
git_prompt () {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then return 0; fi
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  if git diff --quiet 2>/dev/null >&2; then git_status=""
  else git_status=" *"; fi
  echo "($git_branch$git_status)"
}

print_before_the_prompt () {
	printf "\n$txtred%s$txtblu@$txtred%s$txtblu:$bldgrn%s $txtwht$(git_prompt) \n$txtrst" "$USER" "$HOSTNAME" "$PWD"
}

PROMPT_COMMAND=print_before_the_prompt
PS1='-> '
