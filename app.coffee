Jobs = new Mongo.Collection(null)

if Meteor.isServer
 Meteor.methods githubJobs: () ->
  @unblock()
  githubjobs = Meteor.http.call "GET", "https://jobs.github.com/positions.json"

if Meteor.isClient
 Template.jobs.rendered = ->
  Jobs.remove({})
  Meteor.call "githubJobs", (error, results) ->
   Jobs.insert job for job in results.data

 Template.jobs.helpers
  job:
   Jobs.find()
