Class {
	#name : #GhPullRequest,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhPullRequest >> contributor [
  ^ self 
		createFrom: (rawData at: 'user' at: 'url')
		with: [ :data | GhContributor new rawData: data ] 
		onError: [ GhContributor new ]
]

{ #category : #accessing }
GhPullRequest >> createdAt [
 "TODO: implement me"
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
