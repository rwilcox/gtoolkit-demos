Class {
	#name : #GhPullRequest,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhPullRequest >> contributor [
  |output|
  "shortcut normal pattern to reduce number of network requests"
  output := GhContributor new rawData: (rawData at: 'user') .
  output requestClient: requestClient.
  ^ output
		
]

{ #category : #accessing }
GhPullRequest >> createdAt [
 ^ (rawData at: 'created_at') asDateAndTime.
]

{ #category : #accessing }
GhPullRequest >> htmlURL [
  ^ rawData at: 'html_url'.
]

{ #category : #accessing }
GhPullRequest >> name [
  ^ self title.
]

{ #category : #accessing }
GhPullRequest >> title [
  	^ rawData at: 'title'.
]
