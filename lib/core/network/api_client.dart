import 'package:flutter/foundation.dart';

import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:path_provider/path_provider.dart';

class ApiClient {
   ApiClient._internal(); // Private constructor
   static final ApiClient _instance = ApiClient._internal(); // Singleton instance
   factory ApiClient() => _instance; // Factory constructor to return the singleton instance
   late final Dio dio;// Declare the Dio instance late is used to indicate that the variable will be initialized later, but before it is accessed.

    Future<void> init() async { // Initialize the Dio instance with base options
    dio = Dio( // Create a new Dio instance
      BaseOptions( // Set the base options for the Dio instance
        baseUrl: 'https://jsonplaceholder.typicode.com', 
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        
        validateStatus: (status) => false, // Disable status code validation to handle errors manually
        headers: {
          'Content-Type': 'application/json',

          }, // Set the default headers for the Dio instance
      ),
    );

    dio.interceptors.add( // Add an interceptor to the Dio instance to log requests and responses
      LogInterceptor( // Create a new LogInterceptor instance
        requestBody: true, // Log the request body
        requestHeader: true, // Log the request headers
        responseHeader: true, // Log the response headers
        responseBody: true, // Log the response body
        error: true, // Log errors
        logPrint: (obj) {
          if (kDebugMode) print(obj); // Only print logs in debug mode
        },
      ),
    );


    final appDocsDir = await getApplicationDocumentsDirectory(); // Get the application documents directory
    final cacheStore = HiveCacheStore(appDocsDir.path); // Create a new HiveCacheStore instance to store cached responses in the application documents directory


    final cacheOptions = CacheOptions( 
      store: cacheStore, // Set the cache store to the HiveCacheStore instance
      policy: CachePolicy.request, // Set the cache policy to request, which means that the cache will be used only if the request fails
      maxStale: const Duration(days: 7), // Set the maximum stale duration to 7 days, which means that cached responses older than 7 days will be considered stale and will not be used
      );

      // dio.interceptors.add(DioCacheInterceptor(options: cacheOptions)); //" Add a DioCacheInterceptor to the Dio instance to cache responses based on the cache options
       

  
  }



}