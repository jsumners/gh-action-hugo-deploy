# Hugo Deploy Action

This is a simple [GitHub Action](https://github.com/actions) to facilitate
publishing static sites built with [Hugo](https://gohugo.io) to an organization
site. Which is to say:

1. You have a site Hugo project in `foo/site-src` repository.
1. You have a GitHub organization site repository like `foo/foo.github.io`.
1. You want to automated the build and publish process.

## Usage

Add a `.github/workflows/main.yml` file with content like the following:

```yaml
steps:
  - uses: actions/checkout@master
    with:
      submodules: true

  - uses: jsumners/gh-action-hugo-deploy@v1.0.0
    with:
      destination_repo: foo/foo.github.io
      destination_token: ${{ secrets.Deploy_Token }}
```

Add a [secret][secret] to your `site-src` repository named `Deploy_Token`. The
value of this secret should be a GitHub [access token][token] with the "repo"
permissions. This token must have permission to publish to your `.github.io`
repository.

That's it. See the [`action.yml`](/action.yml) file for more information
on the available configuration options.

[secret]: https://help.github.com/en/articles/virtual-environments-for-github-actions#creating-and-using-secrets-encrypted-variables
[token]: https://help.github.com/en/articles/creating-a-personal-access-token-for-the-command-line
