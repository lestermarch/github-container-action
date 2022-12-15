# Example GitHub Container Action
This repository provides an example custom GitHub Action which runs in a container on a runner. The below sections outline the steps involved to recreate the solution.

### Entrypoint
1. Create a script (e.g. `entrypoint.sh`) which the container will execute as your custom action. 

    - In this example, the script simply retrieves the contents of `/proc/meminfo` from the environment on which it runs (the container).

    - The script may reference input variables as environment variables prefixed with `INPUT_` (e.g. `$INPUT_GREETING`).

    - The script may publish outputs by echoing a special string `::set-output` followed by parameters such as the output name (e.g. `echo "::set-output name=memory::$MEMORY"`).

### Dockerfile
2. Create a `Dockerfile` which:
    
    - Pulls an image (e.g. `debian:9.5-slim`)

    - Copies the script to the container (e.g. `ADD entrypoint.sh /entrypoint.sh`)

    - Makes the script executable in the container (e.g. `RUN chmod +x /entrypoint.sh`)

    - Starts the script at runtime (e.g. `ENTRYPOINT ["/entrypoint.sh"]`)

### Action Definition
3. Create an `action.yaml` file with:

    - Metadata including a `name`, `description` and `author`.

    - A list of inputs, each with a `description` and optionally a `default` value and whether it is `required`.

    - A list of outputs, each with a `description`.

    - A `runs` object with `using` set to `docker` and `image` set to the `Dockerfile` created earlier.

### GitHub Action
4. Create an action workflow in `.github\workflows` which:

    - Runs on some trigger (e.g. `push`) and on some runner type (e.g. `ubuntu-latest`).

    - Checks-out the repo using `actions/checkout`.

    - Runs the custom action with an `id` to later reference the `outputs`, and `with` any required input variables.