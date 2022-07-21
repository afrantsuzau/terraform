# AWS S3 Bicket for Terraform state storage

## Workdspaces list: 
  ```
  ❯ terraform workspace list
    default
    production
  * sandbox
    staging
    testing
  ```

## To switch beetween workspaces
  ```
  ❯ terraform workspace select <workspace name>
  ```

## Rest of available workspace commandd
  ```
  ❯ terraform workspace -help
  Usage: terraform [global options] workspace

    new, list, show, select and delete Terraform workspaces.

  Subcommands:
      delete    Delete a workspace
      list      List Workspaces
      new       Create a new workspace
      select    Select a workspace
      show      Show the name of the current workspace
  ```