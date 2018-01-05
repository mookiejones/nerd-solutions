
Meteor.publish('boats',function(args){
		

	 return Boats.find();
});

