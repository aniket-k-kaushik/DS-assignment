# DS-assignment

## Versions and Database 
1. Ruby 3.0.1
2. Rails 7.0.1
3. MySQL

# Assignment 
1. Authentication </br>
   -> Use Devise to authenticate. The signup/login should happen using Rails views.
2. Users </br>
   -> It should have 2 types of users Admin & Referral. </br>
   -> Admin should be created using seed data </br>
3. Referral </br>
   -> An admin user should be able to send a referral email to any email address (in local). </br>
   -> The referral email should contain a link that redirects to sign up page and the referral user should be able to signup. </br>
   -> Admin user’s home page should show all the email addresses that were referred along with invitaion status (Accepted/Pending) and resend invite option. </br>
   -> Admin user should be able to perform the "Resend Invite" action max 5 times per user. </br>
   -> The referral user's home page should show the account details (First Name, Last Name, Email, Referred By). </br>
   -> APIs should also respond to JSON requests.

## SetUp
1. Clone repo to local

```
git clone git@github.com:aniket-k-kaushik/DS-assignment.git
```

2. ENV SetUp </br>
   -> Open .env </br>
   -> Update `DATABASE_URL` in `.env` as per local `MySQL` credentials. </br>
   -> For example, if the user is `aniketkaushik` and password is `aniketkaushik`, change the variable as </br>
      `DATABASE_URL="postgres://aniketkaushik:aniketkaushik@localhost/ds-assignment`

3. Project SetUp

```
bin/setup
```

4. To Run Server

```
bin/dev
```

** For Email, I have used, letter_opener gem </br>
** For Authorization, I have used Pundit gem </br>
** Couldn't complete the referral section last part, APIs should also respond to JSON requests. </br>

## Features

1. Registration | Sign Up
```
http://localhost:3000/users/sign_up
```

![Screenshot from 2023-05-10 17-58-23](https://github.com/aniket-k-kaushik/DS-assignment/assets/94526737/970ee4bb-e6c9-4a00-a962-680e1fd17992)

2. Session | Sign In 
```
http://localhost:3000/users/sign_in
```

![Screenshot from 2023-05-10 18-00-51](https://github.com/aniket-k-kaushik/DS-assignment/assets/94526737/933e9f20-9297-4081-9f13-8c3b710588f0)

3. Admin User Home Page
```
http://localhost:3000/
```

![Screenshot from 2023-05-10 18-02-04](https://github.com/aniket-k-kaushik/DS-assignment/assets/94526737/b8f15329-6f70-4e5c-a790-4feec91ba4f5)

4. Non-Admin User Home Page
```
http://localhost:3000/
```

![Screenshot from 2023-05-10 18-03-22](https://github.com/aniket-k-kaushik/DS-assignment/assets/94526737/49d18b63-498c-4a43-88ee-d66b237bbb2b)

5. User Invite Referrals
```
http://localhost:3000/referrals/new
```

![Screenshot from 2023-05-10 18-06-02](https://github.com/aniket-k-kaushik/DS-assignment/assets/94526737/0b5781be-2921-4b8e-845b-f5301fbd10e5)

6. Referral Email 

![Screenshot from 2023-05-10 18-07-19](https://github.com/aniket-k-kaushik/DS-assignment/assets/94526737/72e3918e-21a8-426b-a53f-b01b51eeebb3)

7. Reffered User SignUp Page with refferal_uuid

![Screenshot from 2023-05-10 18-08-53](https://github.com/aniket-k-kaushik/DS-assignment/assets/94526737/e4f45d25-7b9b-4faf-8222-a1fcb6009c13)
