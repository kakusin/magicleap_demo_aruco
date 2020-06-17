#include <stdlib.h>
#include <string.h>
#include <ml_perception.h>
#include <ml_aruco_tracking.h>

#define TRACK_DATA_LENGTH 9

extern "C"
{
	static MLHandle handle;
	static MLArucoTrackerResultArray resultArray;
	static float data[TRACK_DATA_LENGTH];

	void TrackerCreate(float marker_length, int *resultCode)
	{
		MLArucoTrackerSettings settings;
		MLArucoTrackerSettingsInit(&settings);
		settings.dictionary = MLArucoDictionaryName::MLArucoDictionaryName_DICT_4X4_50;
		settings.marker_length = marker_length;
		settings.enable_marker_tracking = true;
		MLResult result = MLArucoTrackerCreate(&settings, &handle);
		*resultCode = (int)result;
	}
	void TrackerDestroy()
	{
		MLArucoTrackerDestroy(handle);
	}
	void TrackerGetResult(float** arrayPtr, int *size)
	{
		MLArucoTrackerGetResult(handle, &resultArray);
		data[0] = (float)resultArray.count;
		if (resultArray.count > 0)
		{
			MLSnapshot *snapshot = nullptr;
			MLPerceptionGetSnapshot(&snapshot);
			MLCoordinateFrameUID frame_uid = resultArray.detections[0]->coord_frame_marker;
			MLTransform transform = {};
			MLSnapshotGetTransform(snapshot, &frame_uid, &transform);
			data[1] = (float)resultArray.detections[0]->id;
			data[2] = transform.position.x;
			data[3] = transform.position.y;
			data[4] = transform.position.z;
			data[5] = transform.rotation.x;
			data[6] = transform.rotation.y;
			data[7] = transform.rotation.z;
			data[8] = transform.rotation.w;
		}
		float* retArr = (float*)malloc(sizeof(data));
		memcpy(retArr, data, sizeof(data));
		*arrayPtr = retArr;
		*size = sizeof(data) / sizeof(data[0]);
	}
	void TrackerReleaseResult()
	{
		MLArucoTrackerReleaseResult(&resultArray);
	}
}
