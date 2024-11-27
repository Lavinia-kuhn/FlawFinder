namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class EvidenceImagesByteQueryResult
    {
        public byte[] EvidenceDataMainByte { get; set; }
        public byte[] EvidenceDataPreviewByte { get; set; }
        public string EvidenceExtension { get; set; }
    }

    public class EvidenceImagesQueryResult
    {
        public string EvidenceDataMain { get; set; }
        public string EvidenceDataPreview { get; set; }
        public string EvidenceExtension { get; set; }
    }

}
