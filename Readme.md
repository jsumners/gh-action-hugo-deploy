```yaml
steps:
  - uses: actions/checkout@master
    with:
      submodules: true

  - uses: jsumners/gh-action-hugo-deploy@master
    with:
      destination_repo: foo/foo.github.io
      destination_token: ${{ secrets.DestinationToken }}
```
