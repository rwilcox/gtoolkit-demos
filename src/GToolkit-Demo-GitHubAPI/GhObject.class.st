Class {
	#name : #GhObject,
	#superclass : #Object,
	#instVars : [
		'rawData',
		'requestClient'
	],
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhObject >> rawData [
	^ rawData ifNil: [ Dictionary new ]
]

{ #category : #accessing }
GhObject >> rawData: dictionary [ 
	rawData := dictionary
]

{ #category : #accessing }
GhObject >> requestClient [
  ^ requestClient ifNil: [ ZnClient new] ifNotNil: [requestClient].
]

{ #category : #accessing }
GhObject >> requestClient: inClient [
  requestClient := inClient.
]
