Param(
  [Parameter(Mandatory = $true)]
  $git_url
)

git clone $git_url .