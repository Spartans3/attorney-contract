pragma solidity ^0.4.24;

contract AttorneyContract{
    
    struct Client{
        bytes32 name;
        address clientAdress;
        uint8 tckn;
        bytes32 adres;
        bytes32 email;
        bytes32 phoneNumber;
        string demand;
    }
        struct Lawyer{
        bytes32 name;
        address lawyerAdress;
        uint8 tckn;
        bytes32 adres;
        bytes32 email;
        bytes32 phoneNumber;
    }
    
/*enum JOBDESCRIPTION{
    ACTION_FOR_NULLITY, FULL_REMEDY_ACTION, LEGAL_REMEDY, EXECUTION_PROCEEDING
}*/

    struct Job{
        bytes32[] jobDescription;
        uint24[] cost;
        
    }
    
    struct AdditionalCosts{
        bytes32[] costType;
        uint24[] additionalCost;
    }
    

    uint24 avukatinAlacagi;
    uint24 toplamJobsCost;
    uint24 toplamAdditionalCost;
    
    function terms() returns (string){
        return "Avukat, konuda belirtilen işin davasının ilk derece yargılamasında ve kanun yollarında takip edilmesi/yürütülmesi hususunda aşağıdaki şartlarla İşsahibi ile anlaşmışlardır. 1) İşle ilgili yargılama harç ve giderleri, yol ve konaklama masrafları ile uzman görüşü masrafları işsahibi tarafından karşılanır. 2) Dava konusu işin bedeli olarak, iş sahibi Avukata, peşin olarak ödeme yapılmamıştır. Lakin iş sahibi ödemenin  aşağıdaki şekilde yapılacağını kabul ve taahhüt etmiştir. - Avukat’a dava neticesinde hükmedilen tutarın % 20 (+KDV) miktarı, vekalet ücreti olarak ödenecektir. -Avukata ödenecek vekalet ücreti tutarı Türkiye Barolar Birliği Avukatlık Asgari Ücret Tarifesi'nde 'Danıştayda, bölge idare, idare ve vergi mahkemelerinde görülen dava ve işlerde' başlığı altında belirtilen ücret miktarından az olamaz  -Mahkeme ve icrada karşı taraf aleyhine hükmedilecek vekâlet ücreti Avukata ait olur. 4) İş sahibi, işten feragat eder veya avukata işi takip olanağı vermezse yahut sözleşmeyle yüklendiği vecibelerini yerine getirmezse, Avukatın yazılı muvafakatini almadan bu iş için başka bir Avukata /Avukat Ortaklığına vekâlet verirse, avukatı haksız yere azlederse, bu halde Avukat ücretin tamamını hak etmiş sayılır. 5) Sözleşme süresi, işin konusu olan dava kesin hükümle sonuçlanıncaya kadar devam eder. 6) Avukat, iş bu sözleşmeyle üstlendiği işi, sözleşme süresince Kanunlar ve Meslek kurallarına göre takip edecektir. Bu göreve kendisi yapabileceği gibi, sorumluluğu kendisine ait olmak üzere, bir başka avukatı yasal olarak da görevlendirebilir. Bilgilendirmeler ve yazışmalar tarafların yukarıdaki e-posta adresine yapılır. İş bu sözleşme, taraflar arasında müzakere edilmesi neticesinde iki nüsha tek sayfa imzalanmıştır.";
        
          }
    
    
    function clientEntry(bytes32 _name,address _clientAddress,uint8 _tckn,bytes32 _adres, bytes32 _email, bytes32 _phoneNumber, string _demand ){
        Client client;
        client.name=_name;
        client.clientAdress= _clientAddress;
        client.tckn = _tckn;
        client.adres = _adres;
        client.email = _email;
        client.phoneNumber = _phoneNumber;
        client.demand = _demand;
    }
    Lawyer lawyer;
    function lawyerEntry(bytes32 _name, address _lawyerAdress, uint8 _tckn,bytes32 _adres, bytes32 _email, bytes32 _phoneNumber){
        
        lawyer.name =_name;
        lawyer.lawyerAdress = _lawyerAdress;
        lawyer.tckn = _tckn;
        lawyer.adres = _adres;
        lawyer.email = _email;
        lawyer.phoneNumber = _phoneNumber;
    }
    
    
    function jobs (bytes32[] _jobDescription, uint24[] _cost){
        Job jobs;
        uint24 toplamJobsCost;
        for(uint i=0; i<_jobDescription.length;i++){
            jobs.jobDescription[i] = _jobDescription[i];
            jobs.cost[i] = _cost[i];
            toplamJobsCost += jobs.cost[i];
        }
    }
    
    function additionalCost(bytes32[] _costType, uint24[] _additionalCost){
        AdditionalCosts a;
        for(uint u=0; u<_costType.length;u++){
            a.costType[u] = _costType[u];
            a.additionalCost[u] = _additionalCost[u];
            toplamAdditionalCost += a.additionalCost[u];
        }
        
        
    }
    
    function maddiManeviTalepEdilen (uint24 _maddi, uint24 _manevi){
        uint24 istenilenTutar = _maddi+_manevi;
        avukatinAlacagi = istenilenTutar/5;
        if(istenilenTutar == 0){
            avukatinAlacagi =6000;
        }
    }
    
    uint24 totalCostToReceiver =avukatinAlacagi + toplamJobsCost + toplamAdditionalCost;
    
    function tlToSzabo() returns(uint24){
        totalCostToReceiver= totalCostToReceiver*50;
        
        return totalCostToReceiver;
    }
    
    function send() payable{
        lawyer.lawyerAdress.transfer(totalCostToReceiver*1000000000000 wei);
    }
}
