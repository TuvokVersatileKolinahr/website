###Production use

    npm install
    node express.js

Mount express app on port 9860 on /api

###Sample data
Open `posts-generator.json` and copy the contents.
Go to [JSON Generator](http://www.json-generator.com/) and paste the code in the first box
Hit 'generate' and watch the magic happen.
Load this data into the mongo instance configured in `express.js`

To import the generated data paste it into a file `myposts.json` and transfer it to your mongo-server.
Then run:
    
    mongoimport --db tuvok --collection posts --file myposts.json
