abstract class TodoState{}
class TodoInitialState extends TodoState{}

class AddTaskState extends TodoState{}

class DeleteTaskState extends TodoState{}

class RemoveTaskState extends TodoState{}

class EditTaskState extends TodoState{}

class GetAllTasksLoadingState extends TodoState{}
class GetAllTasksSuccessState extends TodoState{}
class GetAllTasksErrorState extends TodoState{}

class StoreNewTaskLoadingState extends TodoState{}
class StoreNewTaskSuccessState extends TodoState{}
class StoreNewTaskErrorState extends TodoState{}


class UploadImageLoadingState extends TodoState{}
class UploadImageSuccessState extends TodoState{}
class UploadImageErrorState extends TodoState{}

class UpdateTaskLoadingState extends TodoState{}
class UpdateTaskSuccessState extends TodoState{}
class UpdateTaskErrorState extends TodoState{}

class DeleteTaskLoadingState extends TodoState{}
class DeleteTaskSuccessState extends TodoState{}
class DeleteTaskErrorState extends TodoState{}

class ShowStatisticsLoadingState extends TodoState{}
class ShowStatisticsSuccessState extends TodoState{}
class ShowStatisticsErrorState extends TodoState{}

class GetMoreTasksLoadingState extends TodoState{}
class GetMoreTasksSuccessState extends TodoState{}
class GetMoreTasksErrorState extends TodoState{}

class GetTasksFromFireStoreLoadingState extends TodoState{}
class GetTasksFromFireStoreSuccessState extends TodoState{}
class GetTasksFromFireStoreErrorState extends TodoState{}
