# Router.configure
# 	layoutTemplate:'layout'
# 	notFoundTemplate:'notFound'
# 	loadingTemplate:'loading'
	
# Router.map ->
# 	# @route 'mainLayout',
# 	@route 'bodyTemplate',
# 		path:'/'



if Meteor.isServer
	Meteor.publish 'boats',->
		return Boats.find()
if Meteor.isClient
	Meteor.subscribe 'boats'
Router.map ->
	@route('img',
		path:'/img/:zoom/:lat/:lng'
		where:'server')
	.get ->
	 
		# console.log(@params)


Router.map ->
	@route('api2',
		path:'/api2'
		where:'server')
	.get ->		 
		result = Boats.find({},{limit:10,skip:Math.floor(Math.random() * Boats.find().count())}).fetch()



		json = JSON.stringify(result)
		@response.setHeader 'Content-Type', 'application/json'
		@response.writeHead 200,
			'ContentType':'application/json','Access-Control-Allow-Origin':'*'		
		@response.end json
		return



Router.map ->
	@route('api',
		path:'/api/:boats'
		where:'server')
	.get ->
		console.log(@params)
		boat = @params.boats
		console.log 'testing'

		q = {$or:[
					{'builder':{$regex:boat,$options:'i'}},
					{'sa_disp':{$regex:boat,$options:'i'}},
					{'sa_list':{$regex:boat,$options:'i'}},
					{'loa':{$regex:boat,$options:'i'}},
					{'title':{$regex:boat,$options:'i'}},
					{'bal_disp':{$regex:boat,$options:'i'}},
					{'disp':{$regex:boat,$options:'i'}},
					{'rig_type':{$regex:boat,$options:'i'}},
					{'construct':{$regex:boat,$options:'i'}},
					{'lwl':{$regex:boat,$options:'i'}},
					{'beam':{$regex:boat,$options:'i'}},
					{'hull':{$regex:boat,$options:'i'}},
					{'draft_min':{$regex:boat,$options:'i'}},
					{'draft_max':{$regex:boat,$options:'i'}},
					{'first_built':{$regex:boat,$options:'i'}},
					{'designer':{$regex:boat,$options:'i'}},
					{'last_built':{$regex:boat,$options:'i'}}]
				}


		result = Boats.find(q, limit: 20).fetch()

		json = JSON.stringify(result)
		@response.setHeader 'Content-Type', 'application/json'
		@response.writeHead 200,
			'ContentType':'application/json','Access-Control-Allow-Origin':'*'		
		@response.end json
		return
