## Requirements

- node and npm
- aws cli
- servereless framework

### Configure AWS cli

From the the AWS web console go to IAM > Users:
Then add a new user and give Programmatic access and console access.
Give admin access (not a good idea in general). Then use the credentials
there to setup aws cli via:

`aws configure`

Note, you can just copy the .aws home directory to copy the configuration.

### Budgets

In the aws web console go to: budgets >> create budget >> cost budget. Call it
my monthly budget. (Fixed) Budget amount: 10$. Set two alerts:

1. Actual costs 50% of my badget -> email address.
   We will get an email if budget 5$.
2. Forecast cost 80%.
   If aws thinks you are going pay more than 80% of the budget you will get an
   email.

