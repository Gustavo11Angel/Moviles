import UIKit
import PDFKit

@available(iOS 11.0, *)
class SocialesImpresoViewController: UIViewController, PDFViewDelegate {

    //Importamos el PDF VIew
    
    private var pdfView: PDFView?
    
    //PDF Document
    
    private var pdfDocument: PDFDocument?
    
    private var totalPageCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Agregamos el PDF View al View Controller
        
        pdfView = PDFView(frame: self.view.bounds)
        self.view.addSubview(pdfView!)
        
        //Configuración de propiedades del PDF
        
        pdfView?.autoScales = true //Ajusta el PDF a la pantalla
        pdfView?.displayMode = .singlePage
        pdfView?.displayDirection = .horizontal
        pdfView?.usePageViewController(true)
        
        //Configuración para mostrar la página actual y el número total de páginas
        
        
        //Ruta del PDF
        
        guard let path = Bundle.main.url(forResource: "Sociales 15 ago", withExtension: "pdf") else {
            print("No se encontró el archivo")
            return
        }
        
        //Cargar PDF
        
        pdfDocument = PDFDocument(url: path)
        pdfView!.document = pdfDocument
        
        //Obtener el total de páginas
        
        if let total = pdfView?.document?.pageCount{
            totalPageCount = total
        }
        
        handlePageChange()
        
        //Notificador de cambio de página
        
        NotificationCenter.default.addObserver(self, selector: #selector(handlePageChange), name: Notification.Name.PDFViewPageChanged, object: nil)
    }
    
    @objc func handlePageChange(){
        //Obtener la página actual
        let currentPageNum = pdfDocument!.index(for: (pdfView?.currentPage)!)+1
        let pageTotalAndCurrentNumber = "\(currentPageNum)/\(totalPageCount)"
        
        //Cambiamos el Título
        title = "Sociales [\(pageTotalAndCurrentNumber)]"
    
    }
    

}
