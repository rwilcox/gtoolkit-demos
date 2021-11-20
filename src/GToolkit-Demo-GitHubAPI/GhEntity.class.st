Class {
	#name : #GhEntity,
	#superclass : #GhObject,
	#category : #'GToolkit-Demo-GitHubAPI-Model'
}

{ #category : #accessing }
GhEntity >> createFrom: aKey with: aBlock onError: anErrorBlock [
  ^ self createWith: rawData from: aKey with: aBlock onError: anErrorBlock.
	
]

{ #category : #accessing }
GhEntity >> createWith: dataDictionary from: aKey with: aBlock onError: anErrorBlock [
^ dataDictionary 
		at: aKey
		ifPresent: [ :url | 
			| trimmedUrl |
			trimmedUrl := url
				copyWithRegex: '{.*}'
				matchesTranslatedUsing: [ :each | ''].
			(self requestClient) 
				get: trimmedUrl
				onSuccess: [ :result | |newObj|
					[
						newObj := aBlock value: (STON fromString: result).
						newObj requestClient: requestClient.
						newObj.
					] on: Error do: [ :e | Transcript << e.
					 anErrorBlock value ] ]
				onError: [ self error: (self requestClient contents). anErrorBlock value ] ]
		ifAbsent: [ {} ]
]

{ #category : #accessing }
GhEntity >> gtRawDataFor: aView [
	<gtView>
	^ aView columnedList 
		title: 'Raw data';
		priority: 60;
		items: [ self rawData isDictionary 
			ifTrue: [ self rawData associations sorted: [:a :b | a key < b key ] ]
			ifFalse: [ self rawData ] ];
		column: 'Property' text: #key; 
		column: 'Value' text: #value;
		send: [ :each | 
			(each key endsWith: '_url')
				ifTrue: [ 
					self 
						createFrom: each key 
						with: [ :dictionary | 
							self propertyToClass 
								at: (each key removeSuffix: '_url') 
								ifPresent: [ :aClass | aClass new rawData: dictionary ]
								ifAbsent: [ dictionary ]] 
						onError: [each value] ]
				ifFalse: [ each value ] ]
]

{ #category : #accessing }
GhEntity >> propertyToClass [
	^ Dictionary new
]
