Class {
	#name : #GhPullRequests,
	#superclass : #GhGroup,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhPullRequests >> items [
  	^ rawData collect: [ :each | GhPullRequest new rawData: each ]
]
