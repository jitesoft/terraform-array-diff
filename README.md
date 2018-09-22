# Array Diff

Simple terraform module which diffs two lists and returns the values that are unique.  

The underlying shell script is set to use bash, but this can be changed by setting the `shell` variable to another value.  


## Requirements

The underlying shell script uses [`jq`](https://stedolan.github.io/jq/) to diff the arrays, so `jq` is a requirement.
