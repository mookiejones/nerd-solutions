MessageItems = new Mongo.Collection('messageitems');

if Meteor.isServer
	Meteor.publish 'messageitems',(args)->
		MessageItems.find();
if Meteor.isClient
	Meteor.subscribe 'messageitems'

 
Router.map ->
	@route('messageitems',
		path:'/api/messageitems'
		where:'server')
	.get ->
		console.log('hello');
		result=MessageItems.find({}).fetch();


		json = JSON.stringify(result)
		@response.setHeader 'Content-Type', 'application/json'
		@response.writeHead 200,
			'ContentType':'application/json','Access-Control-Allow-Origin':'*'		
		@response.end json
		return
