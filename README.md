# Cloudways - Update `webroot` action
A GitHub Action to update a Cloudways App's `webroot` for use in an atomic deployment pipeline.

## Example

You can obtain the App + Server ID's by looking at the URL for respective app/server, e.g for server: `https://platform.cloudways.com/server/<server_id>/access_detail`

```
steps:
  - name: Update webroot
    uses: sitemill/cloudways-webroot-action@main
    with:
      email: your@email.com
      api_key: <apiKey>
      app_id: <appId>
      server_id: <serverId>
      webroot: current/web
```

# TODO

- ⬜️ Document
- ⬜ Look at options for returning success/failure
- ⬜ Icon