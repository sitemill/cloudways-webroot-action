# Cloudways - Update `webroot` action
A GitHub Action to update a Cloudways App's `webroot` for use in an atomic deployment pipeline.

## Example

You can obtain the App + Server ID's by looking at the URL for respective app/server, e.g for server: `https://platform.cloudways.com/server/<server_id>/access_detail`

```
steps:
  - name: Update webroot
    uses: sitemill/cloudways-webroot-action@v1.0.2
    with:
      email: your@email.com
      api_key: <apiKey>
      app_id: <appId>
      server_id: <serverId>
      webroot: current/web
```

# TODO

- ⬜ Convert to JS action
- ⬜️ Better documentation
- ✅ Look at options for returning success/failure
- ✅️ Icon