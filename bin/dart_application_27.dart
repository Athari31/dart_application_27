void mergeSort(List<int> arr, int left, int right) {
  if (left < right) {
    int middle = (left + right) ~/ 2;

    mergeSort(arr, left, middle);
    mergeSort(arr, middle + 1, right);

    merge(arr, left, middle, right);
  }
}

void merge(List<int> arr, int left, int middle, int right) {
  int n1 = middle - left + 1;
  int n2 = right - middle;

  List<int> leftArr = List<int>.filled(n1, 0);
  List<int> rightArr = List<int>.filled(n2, 0);

  for (int i = 0; i < n1; i++) {
    leftArr[i] = arr[left + i];
  }
  for (int j = 0; j < n2; j++) {
    rightArr[j] = arr[middle + 1 + j];
  }

  int i = 0, j = 0, k = left;

  while (i < n1 && j < n2) {
    if (leftArr[i] <= rightArr[j]) {
      arr[k] = leftArr[i];
      i++;
    } else {
      arr[k] = rightArr[j];
      j++;
    }
    k++;
  }

  while (i < n1) {
    arr[k] = leftArr[i];
    i++;
    k++;
  }

  while (j < n2) {
    arr[k] = rightArr[j];
    j++;
    k++;
  }
}

void main() {
  List<int> arr = [12, 11, 13, 5, 6, 7];
  int n = arr.length;

  print("Original array: ${arr}");
  
  mergeSort(arr, 0, n - 1);

  print("Sorted array: ${arr}");
}

