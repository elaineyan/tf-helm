# tf-helm

Minimal GitHub Actions template to achieve:
1. Terraform plan → Results automatically posted as PR comments
2. Helm test (chart syntax + unit tests) → Results similarly posted as comments
3. Both run within the same push/PR, with two jobs executed in parallel
Note: Only requires enabling Pull Request Write permissions for the repository.

To require someone reviewing the code:
① New Environment
Settings → Environments → New environment → enter 'prod' → Configure environment
② Add reviewers
Required reviewers → Add 1 user or team → Save protection rules
③ add job as below to run terraform apply
...
terraform-apply:               
  needs: terraform-plan         
  runs-on: ubuntu-latest
  environment: prod             
  steps:
    - uses: actions/checkout@v4
    - uses: hashicorp/setup-terraform@v3
      with:
        terraform_version: ${{ env.TF_VERSION }}

    - name: Terraform Init
      run: terraform init

    - name: Terraform Apply
      run: terraform apply -auto-approve
...