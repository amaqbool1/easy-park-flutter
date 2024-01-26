import 'package:easy_park/src/feature/dashboard/select_vehicle/select_vehicle.dart';
import 'package:flutter/cupertino.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../feature/auth/login/domain/domain.dart';
import '../feature/auth/sign_up/sign_up.dart';
import '../feature/dashboard/pick_parking_spot/pick_parking_spot.dart';

class IsarService {
  late Future<Isar> db;

  //* Isar Service Constructor
  IsarService() {
    db = openDB();
  }

  //* Save Sign Up
  Future<void> createAccount(SignUp signUp) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.signUps.putSync(signUp));
  }

  //* Save Login User
  Future<void> saveLoginUser(Login login) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.logins.putSync(login));
  }

  //* Save Login User
  Future<List<Login>> getLoginUsers() async {
    final isar = await db;
    return await isar.logins.where().findAll();
  }

  //* Get All Accounts
  Future<List<SignUp>> getAllAccounts() async {
    final isar = await db;
    return await isar.signUps.where().findAll();
  }

  //* Add Vehicle
  Future<void> addVehicle(Vehicle vehicle) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.vehicles.putSync(vehicle));
  }

  //* Get All Vehicles
  Future<List<Vehicle>> getAllVehicles() async {
    final isar = await db;
    return await isar.vehicles.where().findAll();
  }

  //* Add parking Spots
  Future<void> addParkingSpot(ParkingSpot parkingSpot) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.parkingSpots.putSync(parkingSpot));
  }

  //* Get All Parking Spots
  Future<List<ParkingSpot>> getParkingSpotList() async {
    final isar = await db;
    return await isar.parkingSpots.where().findAll();
  }

  /// Update Parking Spot
  Future<List<ParkingSpot>> updateParkingSpot(ParkingSpot parkingSpot) async {
    final isar = await db;
    final updatedParkingSpot = await isar.parkingSpots.get(parkingSpot.id);

    updatedParkingSpot!.parkingSpotNumber = parkingSpot.parkingSpotNumber;
    updatedParkingSpot.alreadyBooked = parkingSpot.alreadyBooked;
    updatedParkingSpot.isSelected = parkingSpot.isSelected;
    isar.writeTxnSync<void>(
        () => isar.parkingSpots.putSync(updatedParkingSpot!));
    return await isar.parkingSpots.where().findAll();
  }

  //* Add parking
  Future<void> addParking(Parking parkingSpot) async {
    final isar = await db;
    isar.writeTxnSync<int>(() => isar.parkings.putSync(parkingSpot));
  }

  //* Get All Booked Parking List
  Future<List<Parking>> getBookedParkingList() async {
    final isar = await db;
    return await isar.parkings.where().findAll();
  }

  //* Update Parking
  Future<List<Parking>> updateParking(Parking parking) async {
    final isar = await db;
    final updatedParking = await isar.parkings.get(parking.id);

    updatedParking!.totalHours = parking.totalHours;
    updatedParking.totalAmount = parking.totalAmount;
    updatedParking.parkingAddress = parking.parkingAddress;
    updatedParking.parkingName = parking.parkingName;
    updatedParking.parkingSpotStatus = parking.parkingSpotStatus;
    updatedParking.vehicleName = parking.vehicleName;
    updatedParking.vehicleNumber = parking.vehicleNumber;
    updatedParking.id = parking.id;
    updatedParking.parkingDate = parking.parkingDate;
    updatedParking.startHour = parking.startHour;
    updatedParking.endHour = parking.endHour;
    updatedParking.parkingSpotNumber = parking.parkingSpotNumber;

    isar.writeTxnSync<void>(() => isar.parkings.putSync(updatedParking));
    return await isar.parkings.where().findAll();
  }

  // //* Listen For All Conversations
  // Stream<List<Conversation>> listenToConversations() async* {
  //   final isar = await db;
  //   yield* isar.conversations.where().watch(fireImmediately: true);
  // }
  //
  // //* Get Messages List For Conversation
  // Future<List<Message>> getMessagesFor(Conversation conversation) async {
  //   final isar = await db;
  //   return await isar.messages
  //       .filter()
  //       .conversation((q) => q.idEqualTo(conversation.id))
  //       .findAll();
  // }
  //
  // //* Save Activities
  // Future<void> saveActivities(Activities newActivity) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(() => isar.activities.putSync(newActivity));
  // }
  //
  // //* Save Activities
  // Future<void> savePersons(PersonsModelForIsar personsModelForIsar) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(
  //           () => isar.personsModelForIsars.putSync(personsModelForIsar));
  // }
  //
  // //* Get All Activities
  // Future<List<PersonsModelForIsar>> getAllPersons() async {
  //   final isar = await db;
  //   return await isar.personsModelForIsars.where().findAll();
  // }
  //
  // //* Get All Activities
  // Future<List<Activities>> getAllActivities() async {
  //   final isar = await db;
  //   return await isar.activities.where().findAll();
  // }
  //
  // //* Save Activities
  // Future<void> savePermissions(PermissionsModel permissionsData) async {
  //   final isar = await db;
  //   isar.writeTxn<int>(() => isar.permissionsModels.put(permissionsData));
  // }
  //
  // //* Get All Activities
  // Future<List<PermissionsModel>> getPermissions() async {
  //   final isar = await db;
  //   return await isar.permissionsModels.where().findAll();
  // }
  //
  // //* Save Work Orders
  // Future<void> saveWorkOrder(WorkOrder newWorkOrder) async {
  //   final isar = await db;
  //   print("SAVE WORK ORDER");
  //   isar.writeTxnSync<int>(() => isar.workOrders.putSync(newWorkOrder));
  // }
  //
  //
  // //* Save Work Orders
  // Future<void> deleteAllWorkOrder() async {
  //   final isar = await db;
  //
  //   List<WorkOrder>? workOrders = await isar.workOrders.where().findAll();
  //   if (workOrders.isEmpty) {
  //   } else {
  //     await isar.writeTxn(() async {
  //       final count = await isar.workOrders
  //           .deleteAll(workOrders.map((e) => e.nr!).toList());
  //       print('We deleted $count Work Orders');
  //
  //     });
  //   }
  // }
  //
  // //* Get All Work Orders
  // Future<List<WorkOrder>> getAllWorkOrders() async {
  //   final isar = await db;
  //   return await isar.workOrders.where().findAll();
  // }
  //
  // //* Save Comment
  // Future<void> saveComment(Message newMessage) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(() => isar.messages.putSync(newMessage));
  // }
  //
  // //* Get Messages List For Conversation
  // Future<List<Message>> getCommentsFor(Conversation conversation) async {
  //   final isar = await db;
  //   return await isar.messages
  //       .filter()
  //       .conversation((q) => q.idEqualTo(conversation.id))
  //       .findAll();
  // }
  //

  //
  // //* Delete Work Orders
  // Future<void> deleteWorkOrder(WorkOrder order) async {
  //   final isar = await db;
  //
  //   await isar.writeTxn(() async {
  //     final success = await isar.workOrders.delete(order.isarId);
  //   });
  // }
  //
  // //* Save All Time Reports
  // Future<void> saveTimeReports(TimeReports newTimeReport) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(() => isar.timeReports.putSync(newTimeReport));
  // }
  //
  // //* Get All Work Orders
  // Future<List<TimeReports>> getAllTimeReports() async {
  //   final isar = await db;
  //   return await isar.timeReports.where().findAll();
  // }
  //
  //
  // //* Save person
  // Future<void> savePerson(PersonModel newPerson) async {
  //   final isar = await db;
  //   isar.writeTxnSync<int>(() => isar.personModels.putSync(newPerson));
  // }
  //
  // //* Save person
  // Future<List<PersonModel>> updatePerson(PersonModel newPerson) async {
  //   final isar = await db;
  //   final person = await isar.personModels.get(newPerson.isarId);
  //   print("Person Update >>> ${person!.firstname}");
  //   person.firstname = newPerson.firstname;
  //   person.lastname = newPerson.lastname;
  //   person.email = newPerson.email;
  //   person.assignable = newPerson.assignable;
  //   person.phone = newPerson.phone;
  //   person.createdById = newPerson.createdById;
  //   person.createdAt = newPerson.createdAt;
  //   person.updatedAt = person.updatedAt;
  //   person.updatedById = person.updatedById;
  //   person.personId = person.personId;
  //   person.pictureId = person.pictureId;
  //   person.foreignId = person.foreignId;
  //   person.mobilePhone = person.mobilePhone;
  //   person.personalIdentityNumber = newPerson.personalIdentityNumber;
  //   person.timeId = newPerson.timeId;
  //   person.deletedAt = newPerson.deletedAt;
  //   person.deletedById = newPerson.deletedById;
  //   person.identifier = newPerson.identifier;
  //   isar.writeTxnSync<void>(() => isar.personModels.putSync(person));
  //   return await isar.personModels.where().findAll();
  // }
  //
  // //* Get All persons
  // Future<List<PersonModel>> getPerson() async {
  //   final isar = await db;
  //   return await isar.personModels.where().findAll();
  // }

  //* Open Isar DB
  Future<Isar> openDB() async {
    if (Isar.instanceNames.isEmpty) {
      final dir = await getApplicationDocumentsDirectory();

      return await Isar.open(
        [
          LoginSchema,
          SignUpSchema,
          VehicleSchema,
          ParkingSpotSchema,
          ParkingSchema,
        ],
        inspector: true,
        directory: dir.path,
      );
    }

    return Future.value(Isar.getInstance());
  }

  //* Clear Isar DB
  Future<void> cleanDb() async {
    final isar = await db;
    await isar.writeTxn(() => isar.clear());
  }
}
