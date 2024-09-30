const amplifyconfig = '''{
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "us-west-2:56c4393b-cd9c-4fe3-ae4e-8d26cfa5f961",
                            "Region": "us-west-2"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "us-west-2_xBfefGkMk",
                        "AppClientId": "66of9e4q68psu69mlrmp4tgars",
                        "Region": "us-west-2"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH",
                        "socialProviders": [],
                        "usernameAttributes": [
                            "EMAIL"
                        ],
                        "signupAttributes": [
                            "EMAIL"
                        ],
                        "passwordProtectionSettings": {
                            "passwordPolicyMinLength": 8,
                            "passwordPolicyCharacters": []
                        },
                        "mfaConfiguration": "OFF",
                        "mfaTypes": [
                            "SMS"
                        ],
                        "verificationMechanisms": [
                            "EMAIL"
                        ]
                    }
                }
            }
        }
    },
     "api": {
    "plugins": {
        "awsAPIPlugin": {
            "HyDEN-AppSync": {
                "endpointType": "GraphQL",
                "endpoint": "https://imbmd64oozbtjgx7dyumcsnmdy.appsync-api.us-west-2.amazonaws.com/graphql",
                "region": "us-west-2",
                "authorizationType": "AWS_IAM"
            }
        }
    }
  }
}''';
