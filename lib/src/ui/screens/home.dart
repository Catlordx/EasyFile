import 'package:flutter/material.dart';
import 'package:xfm/src/ui/widgets/home/file_view.dart';
import 'package:xfm/src/ui/widgets/sidebar.dart';

class FileExplorerHome extends StatefulWidget {
  const FileExplorerHome({super.key});

  @override
  State<FileExplorerHome> createState() => _FileExplorerHomeState();
}

class _FileExplorerHomeState extends State<FileExplorerHome> {
  bool _isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Sidebar
          Container(
              width: 230,
              color: Colors.grey.shade200,
              child: FileManagerSidebar()),

          // Main Content Area
          Expanded(
            child: Column(
              children: [
                // Toolbar
                Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back),
                        onPressed: () {},
                      ),
                      IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {},
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: const Icon(Icons.search),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      IconButton(
                        icon: Icon(_isGridView ? Icons.grid_view : Icons.list),
                        onPressed: () {
                          setState(() {
                            _isGridView = !_isGridView;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                // File View
                Expanded(
                    child: Container(
                        color: Colors.white,
                        child: _isGridView
                            ? FileGridView(itemCount: 20, onItemTap: (index) {})
                            : FileListView(
                                itemCount: 20, onItemTap: (index) {}))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
