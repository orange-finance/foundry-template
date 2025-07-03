# Foundry Template

A Foundry-based smart contract development template with integrated security tools.

## Prerequisites

- [Foundry](https://book.getfoundry.sh/getting-started/installation)
- [Python 3.8+](https://www.python.org/downloads/) (for Slither)
- [Node.js](https://nodejs.org/) / [Bun](https://bun.sh/) / [pnpm](https://pnpm.io/) / [Yarn](https://yarnpkg.com/)

## Setup

### Codecov Configuration

Before using this template, you need to set up Codecov:

1. **Add your repository to Codecov**:
   - Go to [codecov.io](https://codecov.io/)
   - Sign in with your GitHub account
   - Add your GitHub repository from the Codecov dashboard

2. **Set up CODECOV_TOKEN in GitHub**:
   - In Codecov, find your repository and copy the upload token
   - Go to your GitHub repository settings
   - Navigate to Settings → Secrets and variables → Actions
   - Add a new repository secret named `CODECOV_TOKEN` with the token value from Codecov

### Install Dependencies

1. Install dependencies:

```bash
# Using npm
npm install

# Using bun
bun install

# Using pnpm
pnpm install

# Using yarn
yarn install
```

2. Install Slither:

```bash
pip3 install slither-analyzer
```

Or using pipx (recommended):

```bash
pipx install slither-analyzer
```

## Usage

### Testing

```bash
npm test
```

### Linting

```bash
npm run lint:sol       # Check formatting and linting
npm run lint:sol:fix   # Auto-fix formatting and linting issues
```

### Security Analysis with Slither

#### `npm run slither`

Basic security analysis. Runs all detectors and outputs findings to console.

#### `npm run slither:triage`

Interactive mode for reviewing and categorizing findings. Allows you to mark false positives and save triage results.

#### `npm run slither:sarif`

Generates SARIF format output file (results.sarif) for visual analysis in IDEs.

### GitHub Actions Integration

This project uses GitHub Actions to automatically run Slither analysis on every push and pull request. The workflow:

1. Runs Slither analysis on the codebase
2. Generates a SARIF file with all findings
3. Uploads the SARIF file to GitHub Code Scanning

You can view the security findings in:

- **Pull Requests**: Security findings appear as annotations in the Files Changed tab
- **Security tab**: Navigate to Repository → Security → Code scanning alerts
- **SARIF file**: Download the SARIF artifact from the workflow run for local analysis

This approach allows you to:

- Review security findings without breaking CI/CD pipelines
- Triage and dismiss false positives directly in GitHub
- Track security issues over time
- Integrate with GitHub's security features

### Visual Analysis with SARIF Viewer (VS Code)

For a better developer experience in VS Code, install the [SARIF Viewer extension](https://marketplace.visualstudio.com/items?itemName=MS-SarifVSCode.sarif-viewer):

1. **Generate SARIF output**:

   ```bash
   npm run slither:sarif
   ```

2. **Open in VS Code**:

   - The SARIF Results Panel will automatically open
   - View issues as squiggles in your source code
   - Navigate through findings in the Problems list
   - Use the dedicated SARIF Results Panel for advanced filtering and grouping

3. **Benefits**:
   - Visual indicators in source code
   - Easy navigation between findings
   - Rich details and code snippets
   - Direct links to affected code locations

### Managing Slither Findings

When reviewing Slither findings:

1. **Run basic analysis to see detailed findings**:

   ```bash
   npm run slither
   ```

2. **Review and triage findings locally**:

   ```bash
   npm run slither:triage
   ```

   - Mark false positives
   - Save triage database for future runs

3. **Fix actual issues** in your code based on the findings

4. **If needed, exclude specific detectors** in `slither.config.json`:

   ```json
   {
     "detectors_to_exclude": "naming-convention,solc-version,reentrancy-benign"
   }
   ```

5. **For temporary exclusions**, add paths to `filter_paths`:

   ```json
   {
     "filter_paths": "lib,node_modules,test"
   }
   ```

6. **For specific code sections**, use inline comments:
   ```solidity
   // slither-disable-next-line all
   // slither-disable-start reentrancy-eth
   // ... code ...
   // slither-disable-end reentrancy-eth
   ```

## Slither Configuration

The project uses `slither.config.json` to configure Slither's behavior:

- Excludes `lib` and `node_modules` directories
- Excludes naming convention and solc version detectors by default

Modify `slither.config.json` to customize the analysis based on your needs.
