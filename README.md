# Polystat panel plugin extension for grafonnet

A library that extends [grafonnet](https://github.com/grafana/grafonnet-lib) with [Polytstat panel](https://grafana.com/grafana/plugins/grafana-polystat-panel) plugin template (By Grafana Labs).

Based on version 1.1.0 of Polystat panel.

## Getting started

### Prerequisites

[grafonnet](https://github.com/grafana/grafonnet-lib) and its dependencies must be installed.

### Install grafonnet-polystat-panel

Clone this git repository inside the grafonnet one:

```
git clone https://github.com/thelastpickle/grafonnet-polystat-panel.git
```

You can use [Jsonnet Bundler](https://github.com/jsonnet-bundler/jsonnet-bundler) instead:
```json
{
  "dependencies": [
    {
      "source": {
        "git": {
          "remote": "https://github.com/grafana/grafonnet-lib",
          "subdir": "grafonnet"
        }
      },
      "version": "master"
    },
    {
      "source": {
        "git": {
          "remote": "https://github.com/thelastpickle/grafonnet-polystat-panel",
        }
      },
      "version": "master"
    }
  ],
  "legacyImports": true
}

```

Then import the plugins with grafonnet in your jsonnet code:

```jsonnet
local grafana = (import 'grafonnet/grafana.libsonnet')
              + (import 'grafonnet-polystat-panel/plugin.libsonnet');
```

## Example of usage

See [tests](./tests/test.jsonnet) for example.

## Contributing

Feel free to submit issues, as well as pull requests.
