#include <iostream>
#include <fstream>
#include <vector>
#include <chrono>
 
void process_file(const std::string& filename) {
    std::fstream file(filename, std::ios::in | std::ios::out | std::ios::binary);
    if (!file) {
        std::cerr << "Error opening file: " << filename << std::endl;
        return;
    }
 
    int value;
    while (file.read(reinterpret_cast<char*>(&value), sizeof(int))) {
        value *= 2;  
        file.seekp(-sizeof(int), std::ios::cur);  
        file.write(reinterpret_cast<char*>(&value), sizeof(int));
        file.flush(); 
    }
}
 
int main(int argc, char* argv[]) {
    if (argc != 2) {
        std::cerr << "Usage: " << argv[0] << " <file_number>" << std::endl;
        return 1;
    }
 
    const std::string filename = "file_" + std::string(argv[1]) + ".bin";
    auto start = std::chrono::high_resolution_clock::now();
    process_file(filename);
    auto end = std::chrono::high_resolution_clock::now();
 
    auto duration = std::chrono::duration_cast<std::chrono::milliseconds>(end - start).count();
    std::cout << "Processed " << filename << " in " << duration << " ms" << std::endl;
    return 0;
}