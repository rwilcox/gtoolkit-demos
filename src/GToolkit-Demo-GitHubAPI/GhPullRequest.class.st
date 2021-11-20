Class {
	#name : #GhPullRequest,
	#superclass : #GhEntity,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhPullRequest >> contributor [
  ^ self 
		createWith: (rawData at: 'user') from: 'url'
		with: [ :data | GhContributor new rawData: data ] 
		onError: [ GhContributor new ]
]

{ #category : #accessing }
GhPullRequest >> createdAt [
 ^ rawData at: 'created_at'
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
