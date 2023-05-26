# Craft CMS Tutorial Site

This repository represents the final state of our [Getting Started with Craft CMS](https://craftcms.com/docs/getting-started-tutorial/) tutorial.

## Usage

If you would like to start with a fully-functional project (or have an examplar at your fingertips), follow these steps:

1. **Clone the repository:** `git clone https://github.com/craftcms/tutorial-project.git`;
1. **Move into the directory:** `cd tutorial-project`;
1. **Boot up development environment:** `ddev start` (assuming you have [DDEV](https://craftcms.com/docs/4.x/installation.html) installed);
1. **Install dependencies:** `ddev composer install`;
1. **Set a security key:** `ddev craft setup/security-key`;
1. **Import database:**: `ddev craft db/restore seed.sql`;

Run `ddev launch` or `ddev launch admin` to get started! The admin account included in `seed.sql` has the username `admin` and the password `password`.

> **Note:** If you created a new project while following the tutorial, you may encounter a project name conflict when starting DDEV. Change the `name` property in `.ddev/config.yml` to something like `tutorial-final`, then try `ddev start` again.
