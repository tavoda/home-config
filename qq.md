# swagger-java-client

## Requirements

Building the API client library requires [Maven](https://maven.apache.org/) to be installed.

## Installation

To install the API client library to your local Maven repository, simply execute:

```shell
mvn install
```

To deploy it to a remote Maven repository instead, configure the settings of the repository and execute:

```shell
mvn deploy
```

Refer to the [official documentation](https://maven.apache.org/plugins/maven-deploy-plugin/usage.html) for more information.

### Maven users

Add this dependency to your project's POM:

```xml
<dependency>
    <groupId>io.swagger</groupId>
    <artifactId>swagger-java-client</artifactId>
    <version>1.0.0</version>
    <scope>compile</scope>
</dependency>
```

### Gradle users

Add this dependency to your project's build file:

```groovy
compile "io.swagger:swagger-java-client:1.0.0"
```

### Others

At first generate the JAR by executing:

    mvn package

Then manually install the following JARs:

* target/swagger-java-client-1.0.0.jar
* target/lib/*.jar

## Getting Started

Please follow the [installation](#installation) instruction and execute the following Java code:

```java

import io.swagger.client.*;
import io.swagger.client.auth.*;
import io.swagger.client.model.*;
import io.swagger.client.api.MediaApi;

import java.io.File;
import java.util.*;

public class MediaApiExample {

    public static void main(String[] args) {
        
        MediaApi apiInstance = new MediaApi();
        String serverName = "matrix.org"; // String | The server name from the ``mxc://`` URI (the authoritory component) 
        String mediaId = "ascERGshawAWawugaAcauga"; // String | The media ID from the ``mxc://`` URI (the path component) 
        try {
            File result = apiInstance.matrixMediaR0DownloadServerNameMediaIdGet(serverName, mediaId);
            System.out.println(result);
        } catch (ApiException e) {
            System.err.println("Exception when calling MediaApi#matrixMediaR0DownloadServerNameMediaIdGet");
            e.printStackTrace();
        }
    }
}

```

## Documentation for API Endpoints

All URIs are relative to *https://localhost:8008/*

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*MediaApi* | [**matrixMediaR0DownloadServerNameMediaIdGet**](docs/MediaApi.md#matrixMediaR0DownloadServerNameMediaIdGet) | **GET** /_matrix/media/r0/download/{serverName}/{mediaId} | Download content from the content repository.
*MediaApi* | [**matrixMediaR0ThumbnailServerNameMediaIdGet**](docs/MediaApi.md#matrixMediaR0ThumbnailServerNameMediaIdGet) | **GET** /_matrix/media/r0/thumbnail/{serverName}/{mediaId} | Download a thumbnail of the content from the content repository.
*MediaApi* | [**matrixMediaR0UploadPost**](docs/MediaApi.md#matrixMediaR0UploadPost) | **POST** /_matrix/media/r0/upload | Upload some content to the content repository.
*PresenceApi* | [**matrixClientR0PresenceListUserIdGet**](docs/PresenceApi.md#matrixClientR0PresenceListUserIdGet) | **GET** /_matrix/client/r0/presence/list/{userId} | Get presence events for this presence list.
*PresenceApi* | [**matrixClientR0PresenceListUserIdPost**](docs/PresenceApi.md#matrixClientR0PresenceListUserIdPost) | **POST** /_matrix/client/r0/presence/list/{userId} | Add or remove users from this presence list.
*PresenceApi* | [**matrixClientR0PresenceUserIdStatusGet**](docs/PresenceApi.md#matrixClientR0PresenceUserIdStatusGet) | **GET** /_matrix/client/r0/presence/{userId}/status | Get this user&#39;s presence state.
*PresenceApi* | [**matrixClientR0PresenceUserIdStatusPut**](docs/PresenceApi.md#matrixClientR0PresenceUserIdStatusPut) | **PUT** /_matrix/client/r0/presence/{userId}/status | Update this user&#39;s presence state.
*PushNotificationsApi* | [**matrixClientR0PushersGet**](docs/PushNotificationsApi.md#matrixClientR0PushersGet) | **GET** /_matrix/client/r0/pushers | Gets the current pushers for the authenticated user
*PushNotificationsApi* | [**matrixClientR0PushersSetPost**](docs/PushNotificationsApi.md#matrixClientR0PushersSetPost) | **POST** /_matrix/client/r0/pushers/set | Modify a pusher for this user on the homeserver.
*PushNotificationsApi* | [**matrixClientR0PushrulesGet**](docs/PushNotificationsApi.md#matrixClientR0PushrulesGet) | **GET** /_matrix/client/r0/pushrules/ | Retrieve all push rulesets.
*PushNotificationsApi* | [**matrixClientR0PushrulesScopeKindRuleIdActionsPut**](docs/PushNotificationsApi.md#matrixClientR0PushrulesScopeKindRuleIdActionsPut) | **PUT** /_matrix/client/r0/pushrules/{scope}/{kind}/{ruleId}/actions | Set the actions for a push rule.
*PushNotificationsApi* | [**matrixClientR0PushrulesScopeKindRuleIdDelete**](docs/PushNotificationsApi.md#matrixClientR0PushrulesScopeKindRuleIdDelete) | **DELETE** /_matrix/client/r0/pushrules/{scope}/{kind}/{ruleId} | Delete a push rule.
*PushNotificationsApi* | [**matrixClientR0PushrulesScopeKindRuleIdEnabledPut**](docs/PushNotificationsApi.md#matrixClientR0PushrulesScopeKindRuleIdEnabledPut) | **PUT** /_matrix/client/r0/pushrules/{scope}/{kind}/{ruleId}/enabled | Enable or disable a push rule.
*PushNotificationsApi* | [**matrixClientR0PushrulesScopeKindRuleIdGet**](docs/PushNotificationsApi.md#matrixClientR0PushrulesScopeKindRuleIdGet) | **GET** /_matrix/client/r0/pushrules/{scope}/{kind}/{ruleId} | Retrieve a push rule.
*PushNotificationsApi* | [**matrixClientR0PushrulesScopeKindRuleIdPut**](docs/PushNotificationsApi.md#matrixClientR0PushrulesScopeKindRuleIdPut) | **PUT** /_matrix/client/r0/pushrules/{scope}/{kind}/{ruleId} | Add or change a push rule.
*RoomCreationApi* | [**matrixClientR0CreateRoomPost**](docs/RoomCreationApi.md#matrixClientR0CreateRoomPost) | **POST** /_matrix/client/r0/createRoom | Create a new room
*RoomDirectoryApi* | [**matrixClientR0DirectoryRoomRoomAliasDelete**](docs/RoomDirectoryApi.md#matrixClientR0DirectoryRoomRoomAliasDelete) | **DELETE** /_matrix/client/r0/directory/room/{roomAlias} | Remove a mapping of room alias to room ID.
*RoomDirectoryApi* | [**matrixClientR0DirectoryRoomRoomAliasGet**](docs/RoomDirectoryApi.md#matrixClientR0DirectoryRoomRoomAliasGet) | **GET** /_matrix/client/r0/directory/room/{roomAlias} | Get the room ID corresponding to this room alias.
*RoomDirectoryApi* | [**matrixClientR0DirectoryRoomRoomAliasPut**](docs/RoomDirectoryApi.md#matrixClientR0DirectoryRoomRoomAliasPut) | **PUT** /_matrix/client/r0/directory/room/{roomAlias} | Create a new mapping from room alias to room ID.
*RoomDiscoveryApi* | [**matrixClientR0PublicRoomsGet**](docs/RoomDiscoveryApi.md#matrixClientR0PublicRoomsGet) | **GET** /_matrix/client/r0/publicRooms | Lists the public rooms on the server.
*RoomMembershipApi* | [**matrixClientR0JoinRoomIdOrAliasPost**](docs/RoomMembershipApi.md#matrixClientR0JoinRoomIdOrAliasPost) | **POST** /_matrix/client/r0/join/{roomIdOrAlias} | Start the requesting user participating in a particular room.
*RoomMembershipApi* | [**matrixClientR0RoomsRoomIdBanPost**](docs/RoomMembershipApi.md#matrixClientR0RoomsRoomIdBanPost) | **POST** /_matrix/client/r0/rooms/{roomId}/ban | Ban a user in the room.
*RoomMembershipApi* | [**matrixClientR0RoomsRoomIdForgetPost**](docs/RoomMembershipApi.md#matrixClientR0RoomsRoomIdForgetPost) | **POST** /_matrix/client/r0/rooms/{roomId}/forget | Stop the requesting user remembering about a particular room.
*RoomMembershipApi* | [**matrixClientR0RoomsRoomIdInvitePost**](docs/RoomMembershipApi.md#matrixClientR0RoomsRoomIdInvitePost) | **POST** /_matrix/client/r0/rooms/{roomId}/invite | Invite a user to participate in a particular room.
*RoomMembershipApi* | [**matrixClientR0RoomsRoomIdInvitePost_0**](docs/RoomMembershipApi.md#matrixClientR0RoomsRoomIdInvitePost_0) | **POST** /_matrix/client/r0/rooms/{roomId}/invite  | Invite a user to participate in a particular room.
*RoomMembershipApi* | [**matrixClientR0RoomsRoomIdJoinPost**](docs/RoomMembershipApi.md#matrixClientR0RoomsRoomIdJoinPost) | **POST** /_matrix/client/r0/rooms/{roomId}/join | Start the requesting user participating in a particular room.
*RoomMembershipApi* | [**matrixClientR0RoomsRoomIdKickPost**](docs/RoomMembershipApi.md#matrixClientR0RoomsRoomIdKickPost) | **POST** /_matrix/client/r0/rooms/{roomId}/kick | Kick a user from the room.
*RoomMembershipApi* | [**matrixClientR0RoomsRoomIdLeavePost**](docs/RoomMembershipApi.md#matrixClientR0RoomsRoomIdLeavePost) | **POST** /_matrix/client/r0/rooms/{roomId}/leave | Stop the requesting user participating in a particular room.
*RoomMembershipApi* | [**matrixClientR0RoomsRoomIdUnbanPost**](docs/RoomMembershipApi.md#matrixClientR0RoomsRoomIdUnbanPost) | **POST** /_matrix/client/r0/rooms/{roomId}/unban | Unban a user from the room.
*RoomParticipationApi* | [**matrixClientR0EventsEventIdGet**](docs/RoomParticipationApi.md#matrixClientR0EventsEventIdGet) | **GET** /_matrix/client/r0/events/{eventId} | Get a single event by event ID.
*RoomParticipationApi* | [**matrixClientR0EventsGet**](docs/RoomParticipationApi.md#matrixClientR0EventsGet) | **GET** /_matrix/client/r0/events | Listen on the event stream.
*RoomParticipationApi* | [**matrixClientR0InitialSyncGet**](docs/RoomParticipationApi.md#matrixClientR0InitialSyncGet) | **GET** /_matrix/client/r0/initialSync | Get the user&#39;s current state.
*RoomParticipationApi* | [**matrixClientR0RoomsRoomIdContextEventIdGet**](docs/RoomParticipationApi.md#matrixClientR0RoomsRoomIdContextEventIdGet) | **GET** /_matrix/client/r0/rooms/{roomId}/context/{eventId} | Get events and state around the specified event.
*RoomParticipationApi* | [**matrixClientR0RoomsRoomIdInitialSyncGet**](docs/RoomParticipationApi.md#matrixClientR0RoomsRoomIdInitialSyncGet) | **GET** /_matrix/client/r0/rooms/{roomId}/initialSync | Snapshot the current state of a room and its most recent messages.
*RoomParticipationApi* | [**matrixClientR0RoomsRoomIdMembersGet**](docs/RoomParticipationApi.md#matrixClientR0RoomsRoomIdMembersGet) | **GET** /_matrix/client/r0/rooms/{roomId}/members | Get the m.room.member events for the room.
*RoomParticipationApi* | [**matrixClientR0RoomsRoomIdMessagesGet**](docs/RoomParticipationApi.md#matrixClientR0RoomsRoomIdMessagesGet) | **GET** /_matrix/client/r0/rooms/{roomId}/messages | Get a list of events for this room
*RoomParticipationApi* | [**matrixClientR0RoomsRoomIdReceiptReceiptTypeEventIdPost**](docs/RoomParticipationApi.md#matrixClientR0RoomsRoomIdReceiptReceiptTypeEventIdPost) | **POST** /_matrix/client/r0/rooms/{roomId}/receipt/{receiptType}/{eventId} | Send a receipt for the given event ID.
*RoomParticipationApi* | [**matrixClientR0RoomsRoomIdRedactEventIdTxnIdPut**](docs/RoomParticipationApi.md#matrixClientR0RoomsRoomIdRedactEventIdTxnIdPut) | **PUT** /_matrix/client/r0/rooms/{roomId}/redact/{eventId}/{txnId} | Strips all non-integrity-critical information out of an event.
*RoomParticipationApi* | [**matrixClientR0RoomsRoomIdSendEventTypeTxnIdPut**](docs/RoomParticipationApi.md#matrixClientR0RoomsRoomIdSendEventTypeTxnIdPut) | **PUT** /_matrix/client/r0/rooms/{roomId}/send/{eventType}/{txnId} | Send a message event to the given room.
*RoomParticipationApi* | [**matrixClientR0RoomsRoomIdStateEventTypeGet**](docs/RoomParticipationApi.md#matrixClientR0RoomsRoomIdStateEventTypeGet) | **GET** /_matrix/client/r0/rooms/{roomId}/state/{eventType} | Get the state identified by the type, with the empty state key.
*RoomParticipationApi* | [**matrixClientR0RoomsRoomIdStateEventTypePut**](docs/RoomParticipationApi.md#matrixClientR0RoomsRoomIdStateEventTypePut) | **PUT** /_matrix/client/r0/rooms/{roomId}/state/{eventType} | Send a state event to the given room.
*RoomParticipationApi* | [**matrixClientR0RoomsRoomIdStateEventTypeStateKeyGet**](docs/RoomParticipationApi.md#matrixClientR0RoomsRoomIdStateEventTypeStateKeyGet) | **GET** /_matrix/client/r0/rooms/{roomId}/state/{eventType}/{stateKey} | Get the state identified by the type and key.
*RoomParticipationApi* | [**matrixClientR0RoomsRoomIdStateEventTypeStateKeyPut**](docs/RoomParticipationApi.md#matrixClientR0RoomsRoomIdStateEventTypeStateKeyPut) | **PUT** /_matrix/client/r0/rooms/{roomId}/state/{eventType}/{stateKey} | Send a state event to the given room.
*RoomParticipationApi* | [**matrixClientR0RoomsRoomIdStateGet**](docs/RoomParticipationApi.md#matrixClientR0RoomsRoomIdStateGet) | **GET** /_matrix/client/r0/rooms/{roomId}/state | Get all state events in the current state of a room.
*RoomParticipationApi* | [**matrixClientR0RoomsRoomIdTypingUserIdPut**](docs/RoomParticipationApi.md#matrixClientR0RoomsRoomIdTypingUserIdPut) | **PUT** /_matrix/client/r0/rooms/{roomId}/typing/{userId} | Informs the server that the user has started or stopped typing.
*RoomParticipationApi* | [**matrixClientR0SyncGet**](docs/RoomParticipationApi.md#matrixClientR0SyncGet) | **GET** /_matrix/client/r0/sync | Synchronise the client&#39;s state and receive new messages.
*RoomParticipationApi* | [**matrixClientR0UserUserIdFilterFilterIdGet**](docs/RoomParticipationApi.md#matrixClientR0UserUserIdFilterFilterIdGet) | **GET** /_matrix/client/r0/user/{userId}/filter/{filterId} | Download a filter
*RoomParticipationApi* | [**matrixClientR0UserUserIdFilterPost**](docs/RoomParticipationApi.md#matrixClientR0UserUserIdFilterPost) | **POST** /_matrix/client/r0/user/{userId}/filter | Upload a new filter.
*SearchApi* | [**matrixClientR0SearchPost**](docs/SearchApi.md#matrixClientR0SearchPost) | **POST** /_matrix/client/r0/search | Perform a server-side search.
*ServerAdministrationApi* | [**matrixClientR0AdminWhoisUserIdGet**](docs/ServerAdministrationApi.md#matrixClientR0AdminWhoisUserIdGet) | **GET** /_matrix/client/r0/admin/whois/{userId} | Gets information about a particular user.
*ServerAdministrationApi* | [**matrixClientVersionsGet**](docs/ServerAdministrationApi.md#matrixClientVersionsGet) | **GET** /_matrix/client/versions | Gets the versions of the specification supported by the server.
*SessionManagementApi* | [**matrixClientR0LoginPost**](docs/SessionManagementApi.md#matrixClientR0LoginPost) | **POST** /_matrix/client/r0/login | Authenticates the user.
*SessionManagementApi* | [**matrixClientR0LogoutPost**](docs/SessionManagementApi.md#matrixClientR0LogoutPost) | **POST** /_matrix/client/r0/logout | Invalidates a user access token
*SessionManagementApi* | [**matrixClientR0TokenrefreshPost**](docs/SessionManagementApi.md#matrixClientR0TokenrefreshPost) | **POST** /_matrix/client/r0/tokenrefresh | Exchanges a refresh token for an access token.
*UserDataApi* | [**matrixClientR0Account3pidGet**](docs/UserDataApi.md#matrixClientR0Account3pidGet) | **GET** /_matrix/client/r0/account/3pid | Gets a list of a user&#39;s third party identifiers.
*UserDataApi* | [**matrixClientR0Account3pidPost**](docs/UserDataApi.md#matrixClientR0Account3pidPost) | **POST** /_matrix/client/r0/account/3pid | Adds contact information to the user&#39;s account.
*UserDataApi* | [**matrixClientR0AccountDeactivatePost**](docs/UserDataApi.md#matrixClientR0AccountDeactivatePost) | **POST** /_matrix/client/r0/account/deactivate | Deactivate a user&#39;s account.
*UserDataApi* | [**matrixClientR0AccountPasswordPost**](docs/UserDataApi.md#matrixClientR0AccountPasswordPost) | **POST** /_matrix/client/r0/account/password | Changes a user&#39;s password.
*UserDataApi* | [**matrixClientR0ProfileUserIdAvatarUrlGet**](docs/UserDataApi.md#matrixClientR0ProfileUserIdAvatarUrlGet) | **GET** /_matrix/client/r0/profile/{userId}/avatar_url | Get the user&#39;s avatar URL.
*UserDataApi* | [**matrixClientR0ProfileUserIdAvatarUrlPut**](docs/UserDataApi.md#matrixClientR0ProfileUserIdAvatarUrlPut) | **PUT** /_matrix/client/r0/profile/{userId}/avatar_url | Set the user&#39;s avatar URL.
*UserDataApi* | [**matrixClientR0ProfileUserIdDisplaynameGet**](docs/UserDataApi.md#matrixClientR0ProfileUserIdDisplaynameGet) | **GET** /_matrix/client/r0/profile/{userId}/displayname | Get the user&#39;s display name.
*UserDataApi* | [**matrixClientR0ProfileUserIdDisplaynamePut**](docs/UserDataApi.md#matrixClientR0ProfileUserIdDisplaynamePut) | **PUT** /_matrix/client/r0/profile/{userId}/displayname | Set the user&#39;s display name.
*UserDataApi* | [**matrixClientR0ProfileUserIdGet**](docs/UserDataApi.md#matrixClientR0ProfileUserIdGet) | **GET** /_matrix/client/r0/profile/{userId} | Get this user&#39;s profile information.
*UserDataApi* | [**matrixClientR0RegisterPost**](docs/UserDataApi.md#matrixClientR0RegisterPost) | **POST** /_matrix/client/r0/register | Register for an account on this homeserver.
*UserDataApi* | [**matrixClientR0UserUserIdAccountDataTypePut**](docs/UserDataApi.md#matrixClientR0UserUserIdAccountDataTypePut) | **PUT** /_matrix/client/r0/user/{userId}/account_data/{type} | Set some account_data for the user.
*UserDataApi* | [**matrixClientR0UserUserIdRoomsRoomIdAccountDataTypePut**](docs/UserDataApi.md#matrixClientR0UserUserIdRoomsRoomIdAccountDataTypePut) | **PUT** /_matrix/client/r0/user/{userId}/rooms/{roomId}/account_data/{type} | Set some account_data for the user.
*UserDataApi* | [**matrixClientR0UserUserIdRoomsRoomIdTagsGet**](docs/UserDataApi.md#matrixClientR0UserUserIdRoomsRoomIdTagsGet) | **GET** /_matrix/client/r0/user/{userId}/rooms/{roomId}/tags | List the tags for a room.
*UserDataApi* | [**matrixClientR0UserUserIdRoomsRoomIdTagsTagDelete**](docs/UserDataApi.md#matrixClientR0UserUserIdRoomsRoomIdTagsTagDelete) | **DELETE** /_matrix/client/r0/user/{userId}/rooms/{roomId}/tags/{tag} | Remove a tag from the room.
*UserDataApi* | [**matrixClientR0UserUserIdRoomsRoomIdTagsTagPut**](docs/UserDataApi.md#matrixClientR0UserUserIdRoomsRoomIdTagsTagPut) | **PUT** /_matrix/client/r0/user/{userId}/rooms/{roomId}/tags/{tag} | Add a tag to a room.
*VOIPApi* | [**matrixClientR0VoipTurnServerGet**](docs/VOIPApi.md#matrixClientR0VoipTurnServerGet) | **GET** /_matrix/client/r0/voip/turnServer | Obtain TURN server credentials.


## Documentation for Models

 - [AuthenticationResponse](docs/AuthenticationResponse.md)
 - [AuthenticationResponseFlows](docs/AuthenticationResponseFlows.md)
 - [AvatarUrl](docs/AvatarUrl.md)
 - [Body](docs/Body.md)
 - [Body1](docs/Body1.md)
 - [Body10](docs/Body10.md)
 - [Body11](docs/Body11.md)
 - [Body12](docs/Body12.md)
 - [Body13](docs/Body13.md)
 - [Body14](docs/Body14.md)
 - [Body15](docs/Body15.md)
 - [Body2](docs/Body2.md)
 - [Body3](docs/Body3.md)
 - [Body4](docs/Body4.md)
 - [Body5](docs/Body5.md)
 - [Body6](docs/Body6.md)
 - [Body7](docs/Body7.md)
 - [Body8](docs/Body8.md)
 - [Body9](docs/Body9.md)
 - [Categories](docs/Categories.md)
 - [Categories1](docs/Categories1.md)
 - [ConnectionInfo](docs/ConnectionInfo.md)
 - [DeviceInfo](docs/DeviceInfo.md)
 - [DisplayName](docs/DisplayName.md)
 - [Event](docs/Event.md)
 - [Event1](docs/Event1.md)
 - [EventContext](docs/EventContext.md)
 - [EventContext1](docs/EventContext1.md)
 - [Filter](docs/Filter.md)
 - [Group](docs/Group.md)
 - [Groupings](docs/Groupings.md)
 - [InlineResponse200](docs/InlineResponse200.md)
 - [InlineResponse2001](docs/InlineResponse2001.md)
 - [InlineResponse20010](docs/InlineResponse20010.md)
 - [InlineResponse20011](docs/InlineResponse20011.md)
 - [InlineResponse20012](docs/InlineResponse20012.md)
 - [InlineResponse20013](docs/InlineResponse20013.md)
 - [InlineResponse20014](docs/InlineResponse20014.md)
 - [InlineResponse20015](docs/InlineResponse20015.md)
 - [InlineResponse20016](docs/InlineResponse20016.md)
 - [InlineResponse20017](docs/InlineResponse20017.md)
 - [InlineResponse20018](docs/InlineResponse20018.md)
 - [InlineResponse20019](docs/InlineResponse20019.md)
 - [InlineResponse2002](docs/InlineResponse2002.md)
 - [InlineResponse20020](docs/InlineResponse20020.md)
 - [InlineResponse20021](docs/InlineResponse20021.md)
 - [InlineResponse20022](docs/InlineResponse20022.md)
 - [InlineResponse20023](docs/InlineResponse20023.md)
 - [InlineResponse20024](docs/InlineResponse20024.md)
 - [InlineResponse2003](docs/InlineResponse2003.md)
 - [InlineResponse2004](docs/InlineResponse2004.md)
 - [InlineResponse2005](docs/InlineResponse2005.md)
 - [InlineResponse2006](docs/InlineResponse2006.md)
 - [InlineResponse2007](docs/InlineResponse2007.md)
 - [InlineResponse2008](docs/InlineResponse2008.md)
 - [InlineResponse2009](docs/InlineResponse2009.md)
 - [InlineResponse429](docs/InlineResponse429.md)
 - [Invite3pid](docs/Invite3pid.md)
 - [InvitedRoom](docs/InvitedRoom.md)
 - [JoinedRoom](docs/JoinedRoom.md)
 - [LeftRoom](docs/LeftRoom.md)
 - [PaginationChunk](docs/PaginationChunk.md)
 - [PresenceDiff](docs/PresenceDiff.md)
 - [PresenceState](docs/PresenceState.md)
 - [PublicRoomsChunk](docs/PublicRoomsChunk.md)
 - [Pusher](docs/Pusher.md)
 - [PusherData](docs/PusherData.md)
 - [PusherData1](docs/PusherData1.md)
 - [Pushrule](docs/Pushrule.md)
 - [Result](docs/Result.md)
 - [Results](docs/Results.md)
 - [RoomEventResults](docs/RoomEventResults.md)
 - [RoomEvents](docs/RoomEvents.md)
 - [RoomFilter](docs/RoomFilter.md)
 - [RoomInfo](docs/RoomInfo.md)
 - [RoomInfo1](docs/RoomInfo1.md)
 - [Rooms](docs/Rooms.md)
 - [SessionInfo](docs/SessionInfo.md)
 - [Signed](docs/Signed.md)
 - [StateEvent](docs/StateEvent.md)
 - [ThirdPartyIdentifier](docs/ThirdPartyIdentifier.md)
 - [ThirdPartySigned](docs/ThirdPartySigned.md)
 - [ThirdPartySigned1](docs/ThirdPartySigned1.md)
 - [ThreePidCredentials](docs/ThreePidCredentials.md)
 - [TypingState](docs/TypingState.md)
 - [UnreadNotificationCounts](docs/UnreadNotificationCounts.md)
 - [UnsignedData](docs/UnsignedData.md)
 - [UserProfile](docs/UserProfile.md)


## Documentation for Authorization

Authentication schemes defined for the API:
### accessToken

- **Type**: API key
- **API key parameter name**: access_token
- **Location**: URL query string


## Recommendation

It's recommended to create an instance of `ApiClient` per thread in a multithreaded environment to avoid any potential issues.

## Author



