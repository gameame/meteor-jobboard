Jobs = new Mongo.Collection('jobs')

JOBS_URL = "https://jobs.github.com/positions.json"

if Meteor.isServer
 Meteor.methods githubJobs: () ->
  @unblock()
  Meteor.http.get JOBS_URL, (error, results) ->
   Jobs.remove({})
   Jobs.insert job for job in results.data

if Meteor.isClient
 Template.jobs.rendered = ->
  Meteor.call "githubJobs"

 Template.jobs.helpers
  job:
   Jobs.find()
