# Images should be 440 x 444
CharlesBerman=
	image:'img1-md'
	twitter:'#'
	facebook:'#'
	googleplus:'#'
	name:'Charles Berman'
	title:'Technical Director'
	description:'Technical Director mi porta gravida at eget metus id elit mi egetine...'	
JohnBrown=
	image:'img1-md'
	twitter:'#'
	facebook:'#'
	googleplus:'#'
	name:'John Brown'
	title:'Technical Director'
	description:'Technical Director mi porta gravida at eget metus id elit mi egetine...'

TinaCrueger=
	image:'img2-md'
	twitter:'#'
	facebook:'#'
	googleplus:'#'
	name:'Tina Krueger'
	title:'Lead Designer'	
	description:'Lead Designer mi porta gravida at eget metus id elit mi egetine...'

DavidCase=
	image:'img3-md'
	twitter:'#'
	facebook:'#'
	googleplus:'#'
	name:'David Case'
	title:'Web Developer'
	description:'Web Developer in Unify agency porta gravida at eget metus id elit...'

workers=[
	CharlesBerman,
	DavidCase,
	TinaCrueger,
	JohnBrown
]
Template.teamMembersTemplate.helpers
	teamMembers: () ->
		workers
		# ...