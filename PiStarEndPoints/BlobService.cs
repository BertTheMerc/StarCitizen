using Azure.Identity;
using Azure.Storage.Blobs;
using System.Text;

namespace PiStarEndpoints
{
    public class BlobService
    {
        private readonly BlobContainerClient _container;

        public BlobService(IConfiguration config)
        {
            var client = new BlobServiceClient(config["StarCitizenBlob:ConnectionString"]);
            _container = client.GetBlobContainerClient("data");
        }

        public async Task<string> ReadBlobAsync(string blobName)
        {
            var blobClient = _container.GetBlobClient(blobName);

            if (!await blobClient.ExistsAsync())
                throw new Exception("Blob not found");

            var response = await blobClient.DownloadContentAsync();
            return response.Value.Content.ToString();
        }

        public async Task<Stream> ReadBlobStreamAsync(string blobName)
        {
            var blobClient = _container.GetBlobClient(blobName);

            var response = await blobClient.DownloadStreamingAsync();
            return response.Value.Content;
        }
    }
}
